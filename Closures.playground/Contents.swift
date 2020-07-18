import UIKit

//Simple Closures

let learniOS = {
    print("Hello iOS")
}

let learnSth = {(sth: String)-> String in
    print("I learned \(sth)")
    return "I learned \(sth)"
}

learniOS()
let ans = learnSth("Swift")
print(ans)


//As an argument to another function
print("******************************")
print("As an argument to another function")

func findWork(details: (_ sth:String)-> String){
    print("I am looking for a job.")
    details("SwiftUI")
    print("I find a job!")
}

func findOtherWork(time: String, details: (_ sth: String)->Void){
    print("The time is \(time)")
    details("PHP")
}


findWork(details: learnSth)



//Trailing Closure Syntax 尾随闭包
print("******************************")
print("Trailing Closure Syntax 尾随闭包")

findWork { (lan) -> String in
    print("Study \(lan)")
    return ""
}

/*The transfer parameter has been determined in the function definition*/
findOtherWork(time: "12 AM") { (lan) in
    print("Study \(lan)")
}

func loseWork(details: ()-> Void){
    print("I lose my job.")
    details()
}

loseWork{
    print("What a pity...")
}

//$0 $1
findOtherWork(time: "1 AM") {
    print("Learn \($0)")
}


//The closure is used as the return value of the function
func loseOtherWork() -> (String) -> Void{
    return{ str in
        print("I return a closure called \(str)")
    }
}

func loseAnotherWork() -> (String) -> Void{
    return{
        print("I return a closure called \($0)")
    }
}

let newClosure = loseOtherWork()
newClosure("Wow!")

let newClosure_1 = loseAnotherWork()
newClosure_1("Wow!")

//Closure capture
func closureCapture() -> (String) -> Void{
    var counter = 1
    return{
        print("\($0)\(counter)")
        counter += 1
    }
}

let newClosure_2 = closureCapture()
newClosure_2("iOS")
newClosure_2("iOS")
newClosure_2("iOS")
