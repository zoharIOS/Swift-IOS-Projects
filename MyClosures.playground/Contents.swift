//Closures
var e = Executor()

//Example 1 - predefined function
func task1() {
    let msg = "Passed message"
    print(msg)
}

e.execute(task: task1)

//Example 2 - predefined function & capture
var num = 0
func task2() {
    let n1 = 1
    let n2 = 2
    num = n1+n2
}
e.execute(task: task2)
print(num)

//Example 3 - shorter closure syntax
e.execute(task: { ()->() in
    print("passed msg 2")
})

//Example 4 - even shorter
e.execute(task: { print("passed 4") })
//e.execute { print("another 4") }

//how many tasks executed until now:
print(e.totalTasks)

//Example 5
var result: Double
func multiply(n1: Double, n2: Double) -> Double {
    return n1 * n2
}

result = e.calc(n1: 3.0, n2: 7.1, oper: multiply)
print(result)

//Example 6 - shorter
result = e.calc(n1: 1, n2: 1.5, oper: { (n1: Double, n2: Double) -> Double in
    return n1 * n2
})
print(result)

//Example 7 - shortcut infered type
result = e.calc(n1: 2, n2: 4.6, oper: {(n1, n2) in
    return n1*n2
})

//Exmaple 8 - shortcut++ infer type + implicit return
result = e.calc(n1: 3, n2: 4, oper: { (n1,n2) in n1*n2})
print(result)

//Example 9 - Shortcut++++ Infer type + implicit return + default argument
result = e.calc(n1: 1.2, n2: 2.5, oper: {$0*$1})
print(result)

//Exercise: Plus, Minus, Divide


















