//Example 1
func square(n: inout Int){
    n = n * n
}

var n1 = 10
print(n1)
square(n: &n1)
print(n1)

//Example 2
func swapInt(n1: inout Int, n2: inout Int){
//    let temp = n1
//    n1 = n2
//    n2 = temp
    
    //n1: 5, n2: 7
    n1 += n2 //n1: 12
    n2 = n1 - n2 //n2: 5
    n1 = n1 - n2 //n1: 7
}

var n2 = 5
print("n1: \(n1), n2: \(n2)")
swapInt(n1: &n1, n2: &n2)
print("n1: \(n1), n2: \(n2)")




