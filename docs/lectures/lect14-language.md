# Inversion of Control in Smalltalk

## Class Hierarchy
```
Object
|
|.. Behavior
|.. |.. ClassDescription
|.. |.. |.. Class
|.. |.. |.. Metaclass
|
|.. Boolean
|.. |.. True
|.. |.. False
|
|.. Collection
|.. |.. SequenceableCollection
|.. |.. |.. Array
|.. |.. |.. String
|.. |.. Set
|.. |.. Dictionary
|
|.. Magnitude
|.. |.. Character
|.. |.. Number
|.. |.. |.. Integer
|.. |.. |.. Float
|.. |.. Date
|.. |.. Time
|
|.. BlockClosure
|
|.. UndefinedObject
```

## Part 1: Boolean Control - Leaf Classes Decide

### Different Implementations in True and False
```smalltalk
"Class True implements:"
True >> ifTrue: trueBlock
    ^ trueBlock value

True >> ifFalse: falseBlock  
    ^ nil

True >> ifTrue: trueBlock ifFalse: falseBlock
    ^ trueBlock value


"Class False implements:"
False >> ifTrue: trueBlock
    ^ nil

False >> ifFalse: falseBlock
    ^ falseBlock value

False >> ifTrue: trueBlock ifFalse: falseBlock
    ^ falseBlock value
```

### Usage - The Object Decides
```smalltalk
(x > 5) ifTrue: [ Transcript show: 'big' ].
"Returns true or false object, which decides what to do"

(x > 5) ifTrue: [ Transcript show: 'big' ] 
        ifFalse: [ Transcript show: 'small' ].
"The boolean object picks which block to execute"
```

### BlockClosure Controls Loops
```smalltalk
"whileTrue: is a method on BlockClosure"
[ x < 10 ] whileTrue: [ 
    Transcript show: x printString, ' '.
    x := x + 1 
].

"Implementation:"
BlockClosure >> whileTrue: aBlock
    self value ifTrue: [
        aBlock value.
        self whileTrue: aBlock
    ]
```

## Part 2: Integer Iteration - Objects Control Flow

### timesRepeat: - Simple Repetition
```smalltalk
"Integer implements timesRepeat:"
5 timesRepeat: [ Transcript show: 'hello ' ].

Integer >> timesRepeat: aBlock
    1 to: self do: [:i | aBlock value]
```

### to:do: - The Classic For Loop
```smalltalk
"Iterate with counter"
1 to: 10 do: [:i | 
    Transcript show: i printString, ' '
].

"Implementation in Integer:"
Integer >> to: stop do: aBlock
    | current |
    current := self.
    [ current <= stop ] whileTrue: [
        aBlock value: current.
        current := current + 1
    ]
```

### to:by:do: - Custom Steps
```smalltalk
"Every other number"
1 to: 10 by: 2 do: [:i |
    Transcript show: i printString, ' '
].
"Output: 1 3 5 7 9"

"Counting down"
10 to: 1 by: -1 do: [:i |
    Transcript show: i printString, ' '
].

"Implementation:"
Integer >> to: stop by: step do: aBlock
    | current |
    current := self.
    [ current <= stop ] whileTrue: [
        aBlock value: current.
        current := current + step
    ]
```

## The Inversion

Traditional languages:
- Keywords: `if`, `while`, `for`
- Compiler controls flow
- Language calls your code

Smalltalk:
- Methods: `ifTrue:`, `whileTrue:`, `to:do:`
- Objects control flow
- Objects call your code (blocks)

**Hollywood Principle**: "Don't call us, we'll call you"

You pass YOUR code (blocks) to THEIR methods (Integer, Boolean).
They decide when and how to execute it.

## Student Exercise

Add new control structure to Integer:
```smalltalk
Integer >> downTo: stop do: aBlock
    | current |
    current := self.
    [ current >= stop ] whileTrue: [
        aBlock value: current.
        current := current - 1
    ]

"Use it:"
10 downTo: 1 do: [:i | Transcript show: i printString, ' ' ].
```

No language changes needed - just add methods to classes.

