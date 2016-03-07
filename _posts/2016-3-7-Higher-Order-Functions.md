---
layout: post
title:  Higher-Order Functions
date:   2016-3-6
categories: free
---

> 本来打算昨天写的，昨天说好了休假又帮忙解决很多问题。
今天不打算写的，今天实验课太无聊。我决定写一写。

最后的部分可能我会结合swift来写一写。看我写的进度...

## 背景

---

说好的看Learn You a Haskell for Great Good，寒假敲了不少，到higher-order function卡了。光敲已经不能理解了。最近的早上有时候去的早就会看一看理解一下Haskell，把higher-order function看了小半，Lambdas之前的部分，准备写一写，也算是个记录。不得不感叹，这玩意真TM难懂。

## introduction

---

首先简单的说一下Haskell的语法，只有这样我才能更好的把后面的东西写明白。

首先来看一个函数，lucky。

	lucky :: Int -> String	lucky 7 = "LUCKY NUMBER SEVEN!"	lucky x = "Sorry, you're out of luck, pal!"
	
这个其实和swift的语法很相似，以至于我觉得swift这里很大程度上借鉴了haskell的语法。lucky作为一个函数，参数是一个Int类型，返回值是一个String类型。当我们运行时，如果是7，就会显示是幸运数字，如果不是，那就显示sorry。

## higher-order function

---

什么是higher-order function。在haskell第五章的开始说了。

> Haskell functions can take functions as parameters and return functions as return values. A function that does either of these things is called a higher-order function.

在wiki中得介绍是这样的。

> 在数学和计算机科学中，高阶函数是至少满足下列一个条件的函数：
> 接受一个或多个函数作为输入
> 输出一个函数

可以看到这两个其实想表达的意思是一样的。那就是，函数作为参数，或者返回一个函数。

简单的说，在C语言中，我们都是这么写的...void func(int, int) return void。

在haskell中，我们可以这么写，func func(func, func) return func。

在函数式编程中，函数已经成为了头等公民。这就是高阶函数。到这基本上就可以理解面向对象总是说函数式把函数传来传去的梗了...

## func return func

---

我们一个一个来看。先看返回一个函数的情况。

	multThree :: Int -> Int -> Int -> Int	multThree x y z = x * y * z

这是一个函数，参数是三个Int类型，返回这三个Int的乘积。

也可以写成这样。

	multThree :: Int -> (Int -> (Int -> Int))
	
所以，我们来分析书上的一个例子。

	ghci> let multTwoWithNine = multThree 9	ghci> multTwoWithNine 2 3	54
	
在这里，我们让multTwoWithNine等于了一个函数，这个函数是multThree 9。那这个时候multThree 9实际上算是返回了一个函数。那么这样的话，可以将这个函数赋值为一个变量。

也就是我们的multTwoWithNine。这个时候我们的multTwoWithNine实际上要计算的就是两个数的乘积再乘上9，而乘9，实际上不算是一个函数。

这里就达到了函数返回一个函数。即我的标题，func return func。


## func as parameters

---

来看例子。

> In Haskell, functions can take other functions as parameters, and as you’ve seen, they can also return functions as return values.

也就是说，函数可以将函数作为参数。

 	applyTwice :: (a -> a) -> a -> a
 	applyTwice f x = f (f x)
 	
这个例子种，f实际上就是一个方法。

看个例子就明白了。

	ghci> applyTwice (+3) 10	16
	
在这里，我们看上去applyTwice有三个参数，但是前两个参数被包起来了。也就是说，我们有一个函数参数，一个参数和一个返回值。

f x = f (f x)实际上就是f方法执行了两次。

怎么去理解高阶函数呢？实际上在我看来，可以这么理解，第一个函数参数，实际上实现了在第三个参数的操作。

为什么这里会等于16，实际上这样操作的。10 + 3 + 3。也就是，实际上第三个参数执行了函数参数的方法，得到了返回值。

说了这么多还是混乱是吧...感觉上这个例子可能不能很好的说明。那我们看两个好懂的。

	zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]	zipWith' _ [] _ = []
	zipWith' _ _ [] = []	zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
	
按照我上面说的，第一个函数参数，实际上是a，b参数返回c。

那么我们对[a]中的元素和[b]中的元素执行第一个函数的方法，最后返回的应该是列表中的每一个元素操作后的结果。

	ghci> zipWith' (+) [4,2,5,6] [2,6,2,3]	[6,8,7,9]
	
这个例子中，对[a]和[b]中的每一个元素进行+操作。实际上就是第一个(a -> b -> c)中的操作了。

第二行和第三行的意思其实是，第一个函数参数不管它什么类型，我们迪哥参数和第三个参数只要是列表，就返回列表。

这么一看，其实高阶函数也不是很难吧。

再看一个map，这个在rac和rx都有用到。

	map :: (a -> b) -> [a] -> [b]	map _ [] = []	map f (x:xs) = f x : map f xs

我们看这个函数，按照对zipWith'的理解，我们知道，这个操作其实是对[a]列表中的元素进行操作，然后这些值返回一个[b]列表。

我们来分析一个复杂点的map。

	ghci> map (map (^2)) [[1,2],[3,4,5,6],[7,8]]

首先我们(a -> b)要进行的函数操作其实是(map (^2))，那对第一个列表[1,2]来说，又是一个列表了，所以要返回一个列表。(map (^2)) 1 的结果是1，(map (^2)) 2的结果是4，然后返回一个列表，即[1,4]。一次类推，所以结果就是。

	[[1,4],[9,16,25,36],[49,64]]
	
## swift中的应用

---

[Swift 烧脑体操（三） - 高阶函数](http://blog.devtang.com/2016/02/27/swift-gym-3-higher-order-function/)看到了swift中高阶函数的运用。

那我们来迁移一下理解。

	let arr = [1, 2, 4]
	// arr = [1, 2, 4]

	let brr = arr.map {
    	"No." + String($0)
	}
	// brr = ["No.1", "No.2", "No.4"]

第一个arr.map，在map中，实际上就是实现了我们上文map中f的应用，对列表里的每个元素就会进行操作。实际上和haskell中的map函数没有什么差别了。

实际上来说，高阶函数的应用很多，后面我在学习swift之后会继续说说这个高阶函数，当然，在我能搞定的情况下，我想尝试去学学Monad。

> 大概，大概，把我理解的高阶函数交会给工作室学弟学妹们的时候，就是我要离开工作室去考研或者工作的时候了~