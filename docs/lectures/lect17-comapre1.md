<p align="center">
  <a href="https://github.com/txt/se25fall/blob/main/README.md#top"><img src="https://img.shields.io/badge/Home-%23ff5733?style=flat-square&logo=home&logoColor=white" /></a>
  <a href="/docs/syllabus.md#top"><img src="https://img.shields.io/badge/Syllabus-%230055ff?style=flat-square&logo=openai&logoColor=white" /></a>
  <a href="https://docs.google.com/spreadsheets/d/1E7H6IiFEV0WIooE1biPB7VVrdaEtBh6yXC-2nrwPKCY/edit?gid=0#gid=0"><img src="https://img.shields.io/badge/Teams1-%23ffd700?style=flat-square&logo=users&logoColor=white" /></a>
  <a href="https://docs.google.com/spreadsheets/d/1i0fNqKea0LzqmB-h8gtOrnF0MM-qt560goU4QkRw8BA/edit?usp=sharing"><img src="https://img.shields.io/badge/Teams2-%23ffcc00?style=flat-square&logo=users&logoColor=white" /></a>
  <a href="https://moodle-courses2527.wolfware.ncsu.edu/course/view.php?id=4690&bp=s"><img src="https://img.shields.io/badge/One-%23dc143c?style=flat-square&logo=moodle&logoColor=white" /></a>
  <a href="https://moodle-courses2527.wolfware.ncsu.edu/course/view.php?id=4691&bp=s"><img src="https://img.shields.io/badge/Two-%23b22222?style=flat-square&logo=moodle&logoColor=white" /></a>
  <a href="https://discord.gg/YnAw7uZxAD"><img src="https://img.shields.io/badge/Chat-%23008080?style=flat-square&logo=discord&logoColor=white" /></a>
  <a href="https://ncsu.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=7b1bbb56-937c-42a1-96b4-b33e0134710f"><img src="https://img.shields.io/badge/Vids-%23ffa500?style=flat-square&logo=youtube&logoColor=white" /></a>
  <a href="/LICENSE.md"><img src="https://img.shields.io/badge/©%20timm%202025-%234b4b4b?style=flat-square&logoColor=white" /></a></p>
<h1 align="center">:cyclone: CSC510: Software Engineering<br>
NC State, Fall '25</h1>




## Prolog

```prolog

% key point:
% every list can be split into a prefix and a tail:
% e.g. [a,b,c,d] = Prefix ++ [X | Rest]

append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]) :-
    append(Xs, Ys, Zs).

member(X,L) :- append(_,[X|_],L).

split(L,X,B4,After):- append(B4, [X|After],L).

delete(X,L0,L) :-
     append(L1,[X|L2],L0),
     append(L1,L2,L).

insert(X,L,[X|L]).
insertAfter(X,Y, L0,L) :-
    append(L1,[X|L2],L0),
    append(L1,[X,Y|L2],L).

sublst(L,Sub):- setof(S,sublst1(L,S),Sub).

sublst1(L,Sub):-
  append(_, Rest, L), append(Sub, _, Rest).
 
```

## Julia

A langauge to weave together multiple types.

Wny? [The modular and feature toggle architectures of Google Chrome](https://link.springer.com/article/10.1007/s10664-018-9639-0)

I look at this and I see we need better ways to initially build systems, then weave them together in all manner of mysterious ways.

Most languages:
- OOP dispatches based on the object before the dot.
- FP dispatches based only on function name.

**Julia:** picks a method based on the types of *every* argument.

> Same function name; different implementations by type combination.

---

### Defining Multiple Methods for One Function

```julia
area(x::Int) = x^2
area(x::Float64) = π * x^2
```

Both are methods of `area`.

---

### Dispatch on Two Arguments

```julia
combine(a::Int, b::Int) = a + b
combine(a::String, b::String) = a * b
combine(a::Int, b::String) = string(a) * b
combine(a::String, b::Int) = a ^ b
```

Examples:

```julia
combine(3, 4)          # 7
combine("hi","yo")     # "hiyo"
combine(3,"x")         # "3x"
combine("ha",3)        # "hahaha"
```

---

### Dispatch Using a Type Hierarchy

```julia
abstract type Shape end
struct Circle <: Shape; r::Float64; end
struct Square <: Shape; s::Float64; end

intersect(a::Circle, b::Circle) = "circle-circle algorithm"
intersect(a::Square, b::Square) = "square-square algorithm"
intersect(a::Circle, b::Square) = "circle-square algorithm"
intersect(a::Square, b::Circle) = intersect(b, a)
```

Example:

```julia
intersect(Circle(1), Square(2))
```

---

### Why SE People Should Care

- Add new *types* without editing old *functions*.
- Add new *functions* without changing type definitions.
- Avoid giant `if type == ...` branches; dispatch picks the method.

---

### Small Example: Tiny Math DSL

```julia
struct Num x::Float64 end
struct Vec xs::Vector{Float64} end

add(a::Num, b::Num) = Num(a.x + b.x)
add(a::Vec, b::Vec) = Vec(a.xs .+ b.xs)
add(a::Num, b::Vec) = Vec(a.x .+ b.xs)
add(a::Vec, b::Num) = Vec(a.xs .+ b.x)
```

Calling:

```julia
add(Num(10), Vec([1,2,3]))
```

---

###  Key Idea (One Sentence)

**In Julia, a function is a name shared by many method definitions, and dispatch chooses the method by checking the types of all arguments.**
