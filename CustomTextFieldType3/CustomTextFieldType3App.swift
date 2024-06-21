//
//  CustomTextFieldType3App.swift
//  CustomTextFieldType3
//
//  Created by mind on 08/04/24.
//

import SwiftUI

@main
struct CustomTextFieldType3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(text: "", placeHolder: "Name", isValid: false,pass: "",placeHolderPass:"",isValidPass: false,lastName: "",placeHolderlastName: "",isValidlastName: false)
        }
    }
}
