//
//  ContentView.swift
//  GuessFlag
//
//  Created by X G on 19/07/2020.
//  Copyright © 2020 catting. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var imageSet = ["UK","China","France","Germany","Italy","Japan","Russia","USA"]
    @State private var questionIndex = 0
    @State private var showAlert = false
    @State private var res = 0
    
    private var feedback: String{
        let ans: String
        if res == 0 {
            ans = "Sorry, try again!"
        }
        else if res == 1{
            ans = "Yes, you are right"
        }
        else{
             ans = "Game Over"
        }
        return ans
    }
    
    private let questionSet = [
        Question(text: "In which country did Turing, the computer pioneer, belong to?", answer: 0),
        Question(text: "Which contry is Germany", answer: 3)
    ]
    
    
    var body: some View {
        
        // 1. Deep Stack 使用Zstack可以将不同组建相互堆叠
        // 2. 要使用背景颜色,需要使用ZStack设置
        ZStack {
            // 3. LinearGradient 线性渐变
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 33 / 255, green:  147 / 255, blue: 176 / 255), Color(red: 109 / 255, green:  213 / 255, blue: 176 / 255)]),
                startPoint: .leading,
                endPoint: .bottomTrailing
            )
                // 4. 忽略安全区
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                
                VStack(spacing: 12) {
                    
                    Spacer()
                        .frame(height: 10)
                    
                    
                    Text("Question \(questionIndex + 1)")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    // 5. 设置字体颜色 foregroundColor
                    
                    Text(questionSet[questionIndex].questionText)
                        .font(.title)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 35)
                    
                    
                    VStack(spacing: 35) {
                        
                        
                        
                        ForEach(0 ..< 4){ num in
                            
                            
                            Button(action: {
                                
                                
                                if self.questionSet[self.questionIndex].questionAns == num {
                                    print("Yes")
                                    self.res = 1
                                }
                                else{
                                    print("No")
                                     self.res = 0
                                    self.showAlert = false
                                    
                                }
                                
                                self.showAlert = true
                                
                                
                                if self.questionIndex < self.questionSet.count - 1{
                                    self.questionIndex += 1
                                }
                                else{
                                     self.res = 2
                                }
                                
                            }) {
                                Image(self.imageSet[num])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                    .shadow(color: Color.black, radius: 2)
                            }
                            .alert(isPresented: self.$showAlert) {
                                Alert(title: Text(self.feedback) , message: nil, dismissButton: .default(Text("Ok")))
                                
                            }
                            
                            
                            
                        }
                    }
                    
                    
                }
                Spacer()
                // 6. 用两个VStack嵌套使整体上移
                
                
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
