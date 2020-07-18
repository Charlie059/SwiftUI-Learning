//
//  ContentView.swift
//  AddShippingAddress
//
//  Created by X G on 18/07/2020.
//  Copyright © 2020 catting. All rights reserved.

//  通过一个简单的快递填写信息App,你会得到以下内容:
//  1. 双向绑定
//  2. Form的构造
//  3. 简单的TextField输入文本信息

import SwiftUI

/* 1. 双向绑定
 在SwiftUI中, 使用@State声明变量可以使内部参数获取外部函数值,在内部函数中使用$Var进行使用
 */




struct ContentView: View {
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    @State private var consignee = ""
    @State private var phoneNum = ""
    @State private var addressDetail = ""
    @State private var selectedFrameworkIndex = 0
    @State private var showAlert = false
    
    // 7. 计算属性ConfirMeg
    
    
    private var ConfirMeg: String{
        """
        Your Consignee Name: \(consignee)
        Your Phone Number: \(phoneNum)
        Your Address: \(addressDetail)
        """
    }
    
    private var buttonDisabled: Bool{
        if (consignee.isEmpty ||  phoneNum.isEmpty || addressDetail.isEmpty)  {
            return true
        }
        else{
            return false
        }
    }
    // // // // // // // // // // // // // // //
    
    
    
    private var frameworks = ["Home", "Office", "School", "Other"]
    
    var body: some View {
        
        //Command + Option + Left/Right可以进行代码折叠
        
        NavigationView {
            Form{
                
                Section{
                    /* 2. Stack
                     在SwiftUI中, 使用Stack可以非常有效并且清晰的描绘UI, 使用类似CSS的描述对界面会很友好
                     */
                    HStack {
                        Text("Name")
                            .bold()
                        
                        Divider()
                        
                        TextField("Please Enter the Consignee Name", text: $consignee)
                        
                    }
                    
                    HStack {
                        Text("Phone")
                            .bold()
                            
                        Divider()
                        
                        TextField("Please Enter the Phone Number", text: $phoneNum)
                            .keyboardType(.numberPad)
                        
                    }
                    
                    HStack {
                        Text("Address")
                            .bold()
                        
                        Divider()
                        
                        TextField("Please Enter the Address", text: $addressDetail)
                        
                        
                    }
                }
                
                Section {
                    /* 3. Section
                     使用Section将内容进行分割,类似iOS中的Setting
                     */
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        /* 3. Picker
                         使用Picker的默认样式需要进行页面跳转,所以在这里我们需要将全部内容加入NavigationView
                         */
                        Text("Label")
                            .bold()
                        Picker(selection: $selectedFrameworkIndex, label: Text("")) {
                            
                            ForEach(0 ..< frameworks.count) {
                                Text(self.frameworks[$0])
                            }
                            /*
                             ForEach(0 ..< frameworks.count) {
                             Text(self.frameworks[selectedFrameworkIndex])
                             
                             }*/
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        
                        /* 4. PickerStyle
                         使用SegmentedPickerStyle
                         
                         Others:
                         
                         DefaultPickerStyle
                         PopUpButtonPickerStyle
                         RadioGroupPickerStyle
                         SegmentedPickerStyle
                         WheelPickerStyle
                         */
                        
                        
                        
                    }.padding(.vertical)
                }
                
                Section {
                    
                    Button(action: {
                        print("Button Pressed!")
                        self.showAlert = true
                    }) {
                        HStack(spacing:15) {
                            /* 5. SF Symbols:
                             https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/
                             */
                            
                            Image(systemName: "arrow.up.message")
                                .font(.title)
                            Text("Upload")
                                .fontWeight(.bold)
                                .font(.title)
                            
                            
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(70)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("SwiftUI Alert!"), message: Text(ConfirMeg), primaryButton: .default(Text("Yes")) {
                                            print("Yeah")
                                    }, secondaryButton: .destructive(Text("Cancel")))
                    
                    }
                    .disabled(buttonDisabled)
                    
                    /* 6. Alert:
                     这里使用了选择警告栏
                     */
                    
                }
                .listRowBackground(Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                
            }
            
            .navigationBarTitle("Deliver😯")
            
            
        }
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
