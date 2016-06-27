---
layout: post
title:  Learn You a Swift for Great Good! part 0 -- Swift Currying
date:   2016-06-27
categories: iOS
---

> 刚刚才发现上一篇的内容和Functional Swift中重了很多(因为买了没看🙄昨天翻了一遍)，而且我是自己尝试写的..今天应该就不会怎么重了，因为我本来就打算按照计划对照Haskell来写Swift，Haskell中高阶函数有map，filter，所以肯定会重。不过除此之外，我还会尽我所能实现Haskell中的其他高阶函数。

对了我看了喵神的[柯里化 (CURRYING)](http://swifter.tips/currying/)以及[Functional Swift](https://www.objc.io/books/functional-swift/)中的柯里化。Functional Swift中的例子其实还不错，但是没有用curry的范型来举例子，再加上我悟性太差，导致看了很久。最终根据Stackoverflow上找到了一个例子，看的差不多了。

我觉得应该可以把这个概念解释的还不错了。

其实在Haskell，是有柯里化(下文统一Currying)的。因为英文是Currying，大概我拙劣的英文觉得Currying是Carrying的意思，也就是，携带..而且Haskell是pure function的，curried是默认的..这个恰好是昨天我想在Swift中实现zipwith函数时候遇到的问题。learnyouahaskell第五章高阶函数一开头就是Curried Functions来开头的。

所以今天先补上Haskell中和Currying还有Partial application相关的概念。

这里是wiki的地址。[Currying](https://en.wikipedia.org/wiki/Currying) and [Partial application](https://en.wikipedia.org/wiki/Partial_application)

Currying我觉得可以简单理解为，你想返回什么都可以。而Partial application可以理解为固定参数得到的函数。

在函数式编程要随时记得，任何参数或者返回值都可能是一个函数。

以上是learnyouahaskell中提到相关的概念的介绍。下面我们来介绍Swift中的Currying。

举两个例子来说明，一个是Stackoverflow上的我稍作了改动..一个是我根据Haskell写的。

```
func curry<A, B, C>(f: (A, B) -> C) -> A -> B -> C {
    return { x in { y in f(x, y) } }
}
```

怎么去理解这种写法的范型，是一个很值得讨论的问题。我以前一直觉得，Swift中像上个函数这么写，是有6个参数的，后来发现我错了，第一个是和上篇文章一样的那个T。我们要传一个函数，而当这个函数传完的时候，现在这个curry会根据之前的那个函数变成了一个A->B->C类型的函数。

所以我们可以暂时不管前面那个参数f:，现在整个函数可以看做是一个A->B->C的函数。

所谓currying，就是说，我现在让这个函数可以返回值是C，或者是返回B->C这样一个函数！这样让函数的扩展性就大大增加了！

> 配图看playground！！！！

```
func curry<A, B, C>(f: (A, B) -> C) -> A -> B -> C {
    return { x in { y in f(x, y) } }
}

func sum(a: Int, b: Int) -> Int {
    return a + b
}

let curriedSum = curry(sum)

let sumWith2 = curriedSum(3)(6)

let sumWith3 = curriedSum(3)

print(sumWith2)

print(sumWith3(5))
```

![currying1](/images/swiftfrp/currying1.png)

我们向curry函数中传一个形如(A, B)->C的函数sum，此时curriedSum是一个**Int->Int->Int**类型的函数，这点很好理解。

下面是重点，我们如果想直接调用计算，因为函数是**Int->Int->Int**，那么就用**curriedSum(num1)(num2)**就可以了，此时的返回值是**Int**，如果我们想固定一个值，那么就用**curriedSum(num1)**，那么此时的返回值其实是**Int->Int**类型。想得到最终那个值的话，就必须再传一个参数，才能让返回类型由**Int->Int**变为**Int**。

可以随时注意**playground**中**sumWith2**和**sumWith3**显示的函数类型。

这也就是currying的最大好处，想返回什么返回什么。可以返回一个->Int，也可以返回一个**Int->Int(一个函数)**。其实不是想返回什么就返回什么，是参数想传什么就传什么，没啥区别。

我们在看一个Haskell中例子，我写了一个Swift版本。这个例子无非就是多了一个参数，不过可以更方便理解。(这个函数是learnyouahaskell第五章高阶函数Curried Functions中第一个函数)

```
func multThree(adder: Int) -> Int -> Int -> Int {
    return {
        a in  {
            b in
            a * b * adder
        }
    }
}

let multTwo = multThree(3)
let multOne = multThree(4)(3)
let multZero = multThree(4)(2)(1)

print(multTwo(2)(1))
print(multOne(2))
print(multZero)
```

![currying2](/images/swiftfrp/currying2.png)

这个函数，其实是一个**Int->Int->Int->Int**类型...一会看Haskell原函数就懂了。所以理论上我们可以返回三种类型，**Int->Int->Int**，**Int->Int**，**Int**。前两个是函数，最后一个是返回值。

就是我们依次**multTwo**和**multOne**。

最后提一个细节，为什么我们调用的时候要用**multThree(4)(2)(1)**？个人觉得，这就是函数式，其实是传了三个函数，只不过是常数函数。所以用()。

最后我们看Haskell中实现**multThree**。

```
multThree :: Int -> Int -> Int -> IntmultThree x y z = x * y * z
```

这个例子我在博客中也有提到，在这个例子中，我们可以去理解参数和返回值都可以是一个函数。

```
ghci> multThree 2 3 4
24
```

首先来说，我们可以直接这么使用，那么就是一个参数(常数)，一个参数(常数)，一个参数(常数)，返回值(常数)。但实际上又可以理解为，**(((multThree 2) 3) 4)**

我们还可以怎么去用这个函数呢。

```
ghci> let multTwoWithNine = multThree 9
ghci> multTwoWithNine 2 3
54
```

这样的话，其实就是

`multThree :: Int -> ((Int -> Int) -> Int)`

这样看来，无论参数也好，返回值也好，都可以是一个函数。

当然，我觉得，在Haskell中写更爽一点。当然为什么那么爽。其实Curry是个姓，这个人的名，叫Haskell。

最后结个尾。

"Currying is common paradigm in functional programming. In fact in Haskell (another functional programming language) every function is curried by default."其实就是..在Haskell中，所有函数都是默认curried。

参考资料

1. [How to understand the currying in Swift?](http://stackoverflow.com/questions/28767658/how-to-understand-the-currying-in-swift)
2. [Curry Function in Swift](http://stackoverflow.com/questions/24107191/curry-function-in-swift)
3. [柯里化 (CURRYING)](http://swifter.tips/currying/)
4. [Currying](https://en.wikipedia.org/wiki/Currying)
5. [thoughtbot/Curry](https://github.com/thoughtbot/Curry/blob/master/Source/Curry.swift)
6. [Learn You a Haskell for Great Good! ](http://learnyouahaskell.com/)
7. [Functional Swift](https://www.objc.io/books/functional-swift/)
8. [Partial application](https://en.wikipedia.org/wiki/Partial_application)
