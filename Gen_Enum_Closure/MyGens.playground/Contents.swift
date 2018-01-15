var mg = MyGens()
//Example 1
mg.printSome("Hello world")
mg.printSome(100)
mg.printSome(1.5)
mg.printSome(false)

//Example 2
var nums:[Int] = mg.singleVal(4)
print(nums)

//Example 3
var x = 10, y = 5
mg.printSome([x, y])
mg.swapVals(v1: &x, v2: &y)
mg.printSome([x, y])

var a = ["Orin","Yossi", "Dima"], b = ["Omri","Rami"]
mg.printSome([a, b])
mg.swapVals(v1: &a, v2: &b)
mg.printSome([a, b])
