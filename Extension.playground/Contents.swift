import UIKit

let res = pow(3, 2)


//类型拓展
extension Int{
    func squared() -> Int{
        return self * self
    }
    
    //计算属性
    var isEven: Bool{
        return self % 2 == 0
    }
    
}

let res_1 = 3.squared()
4.isEven

//协议拓展
let arr = ["1","2","1"]
let set = Set(["1","2","3"])

extension Collection{
    func summarize(){
        print("Total \(self.count)")
        
        for name in self {
            print(name)
        }
    }
}

arr.summarize()
set.summarize()
