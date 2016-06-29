---
layout: post
title:  Learn You a Swift for Great Good! part 1 -- Higher-Order Functions in Swift
date:   2016-06-29
categories: iOS
---

> 今天代码多，话少，基本全是干货，而且应该是没人写过。

今天我们用Swift实现在learnyouahaskell中几个高阶函数。我会把Haskell和Swift的代码都贴出来对照。顺便会加点说明。

上次我们实现了multThree函数，在learnyouahaskell中下一个稍微有点复杂的函数，是applyTwice。直接上Haskell的代码了。

```
applyTwice :: (a -> a) -> a -> aapplyTwice f x = f (f x)
```

这个函数的作用就是，重复执行某一个操作两次。

```
ghci> applyTwice (+3) 1016ghci> applyTwice (multThree 2 2) 9144
```

现在我们用Swift实现这个函数。

```
func applyTwice<U>(f: U -> U, element: U) -> U {
    let a: U = element
    return f(f(a))
}
```

然后写一个**sum3**和上一篇的**multThree**作为我们**applyTwice**中的**f**。

```
func sum3(a: Int) -> Int {
    return a + 3
}

func multThree(adder: Int) -> Int -> Int -> Int {
    return {
        a in  {
            b in
            a * b * adder
        }
    }
}
```

```
let a = applyTwice(sum3, element: 10)
print(a)
// a = 16

let b = applyTwice(multThree(2)(2), element: 9)
print(b)
// b = 144
```

这里有几个问题

1.为什么Haskell中可以用**(+3)**？

我觉得这个问题的回答是，Haskell里+就是一个函数，因为我觉得这么回答才合理...Haskell里所有的操作都是函数，所以对于+来说，就有两个参数，当我们赋值一个参数的时候，按照柯里化的概念，它还可以是一个函数。所以在Haskell中可以直接用+3。

2.为什么在Swift中，我们调用**applyTwice**的时候传的是**sum**而不是**sum(3)**？为什么调用**multThree**的时候又写**multThree(2)(2)**？

因为我们在定义**f**的时候，定义了一个类型是**U -> U**类型，而不是**U**类型，如果我们此时写的是**sum(3)**，那么**sum(3)**本身实际上是一个**U**类型了。所以这里写**sum**。简单的说，函数返回值的类型，其实就是f的类型。而对于**multThree**来说，只有当是**multThree(2)(2)**的时候，它的返回类型才是一个**Int -> Int**类型，从而和我们的**U -> U**对应起来。

实现到这，我们接着learnyouahaskell往下实现。

```
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]zipWith' _ [] _ = []zipWith' _ _ [] = []zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
```

zipWith的作用就是讲两个列表通过某个函数合成一个函数。

```
ghci> zipWith' (+) [4,2,5,6] [2,6,2,3][6,8,7,9]ghci> zipWith' max [6,3,2,1] [7,3,1,5][7,3,2,5]
```

我们用Swift实现一下。偷懒了没做判断，数组长度假定一样..直接就数组1长度-1就行了...

```
func zipWith<U, V>(f: (U, U) -> V, array1: [U], array2: [U]) -> [V] {
    var array3 = [V]()
    for i in 0...array1.count-1 {
        array3.append(f(array1[i], array2[i]))
    }
    return array3
}
```

再写两个函数进行操作。

```
func sum(a: Int, b: Int) -> Int {
    return a + b
}

func max(a: Int, b: Int) -> Int {
    return a > b ? a : b
}
```

```
let c = zipWith(sum, array1: [4,2,5,6], array2: [2,6,2,3])
print(c)
//c = [6, 8, 7, 9]

let d = zipWith(max, array1: [4,2,5,6], array2: [2,6,2,3])
print(d)
//d = [4, 6, 5, 6]
```

接着我们实现fliter，请看Haskell的代码多么的神奇！

```
filter :: (a -> Bool) -> [a] -> [a]filter _ [] = []filter p (x:xs)	| p x       = x : filter p xs	| otherwise = filter p xs
```

我就不贴Haskell的使用了。最后我们实现一下Swift版本的fliter。

```
func jfliter<U>(f: U -> Bool, array: [U]) -> [U] {
    var result = [U]()
    for element in array {
        if f(element) {
            result.append(element)
        }
    }
    return result
}
```

写一个big函数

```
func big(a: Int) -> Bool {
    if a > 3 {
        return true
    } else {
        return false
    }
}
```

```
let e = [1, 2, 3, 4, 5, 6]
let ee = jfliter(big, array: e)
print(ee)
```

这里有一个问题，为什么不用Array的extension扩展？我写的时候遇到一个神奇的问题..没写出来。还在看是什么问题中。

最后，我们看一下Haskell中的foldl，foldl其实就是依次从左边对列表进行操作。

Haskell中的例子都有lambda，解释起来又花好多时间，就不找例子了。我来填一下上次在T沙龙中留下的坑，方志刚写的reverse。如果在Haskell中，直接用foldl，可以让数组逆序排列，因为foldl本来就是从左一个元素一个元素操作，这样的话，会将第一个元素放在数组里，依次放，这样就相当于reverse了，由于在Swift里没有foldl，所以直接用reverse，效果其实是一样的。

至此，我们的就绪工作基本上完成，learnyouahaskell高阶函数剩下的部分太具有Haskell的特性，和Swift我也是在找不到什么联系，就不再说了。

> 这个系列的下一个部分，再写，可能就会直接到Functor了，最近我要好好的再准备一下Haskell的知识，所以可能会停更这个系列一段时间。中间这段时间我尽量在iOS上还有其他干货推出。


参考资料

1. [Learn You a Haskell for Great Good! ](http://learnyouahaskell.com/)

