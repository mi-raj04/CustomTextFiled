//
//  ContentView.swift
//  CustomTextFieldType3
//
//  Created by mind on 08/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var text: String
    @State var placeHolder: String
    @State var isValid: Bool
    
    @State var pass:String
    @State var placeHolderPass: String
    @State var isValidPass: Bool
    
    @State var lastName:String
    @State var placeHolderlastName: String
    @State var isValidlastName: Bool
    @State var isSubmitButtonClick: Bool = false

    var body: some View {
        VStack(spacing:0) {
            FloatingLabelInput(text: $text, placeHolder: $placeHolder, isValid: $isValid, errorMessage: "invalid name", isSubmitClick: $isSubmitButtonClick, validationType: .alphabet,leftImage: Image(.people).resizable()) {
                print("left click")
            }rightClick: {
                print("right click")
            }
            .padding(.horizontal)
            
            FloatingLabelInput(text: $pass, placeHolder: $placeHolderPass, isValid: $isValidPass, errorMessage: "invalid password", isPassword: true, isSubmitClick: $isSubmitButtonClick, validationType: .password) {
                print("left click")
            }rightClick: {
                print("right click")
            }
            .padding(.horizontal)
            
            FloatingLabelInput(text: $lastName, placeHolder: $placeHolderlastName, isValid: $isValidlastName, errorMessage: "invalid lastname",
                               isSubmitClick: $isSubmitButtonClick,validationType: .alphabet) {
                print("left click")
            }rightClick: {
                print("right click")
            }
            .padding(.horizontal)
            
            
            Button {
                isSubmitButtonClick = true
            }label: {
                Text("Submit")
            }.frame(width: 150,height: 60)
                .background(.gray.opacity(0.2))
                .cornerRadius(15)
            
            Spacer()
        }.onAppear {
            placeHolder = "Name"
            placeHolderPass = "Password"
            placeHolderlastName = "Surname"
        }
    }
}

#Preview {
    ContentView(text: "", placeHolder: "Name", isValid: false,pass: "",placeHolderPass:"",isValidPass: false,lastName: "",placeHolderlastName: "",isValidlastName: false, isSubmitButtonClick: false)
}
