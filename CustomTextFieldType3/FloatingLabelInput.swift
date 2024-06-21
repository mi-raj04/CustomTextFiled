//
//  FloatingLabelInput.swift
//  CustomTextFieldType3
//
//  Created by mind on 08/04/24.
//

import SwiftUI

struct FloatingLabelInput: View {
    @Binding var text: String
    @Binding var placeHolder: String
    @Binding var isValid: Bool
    @State var errorMessage:String
    var isPassword:Bool = false
    @State var isSecure:Bool = true
    @Binding var isSubmitClick:Bool
    
    var validationType: String.ValidationType
    var leftImage:Image?
    var rightImage:Image?
    var leftClick:() -> Void?
    var rightClick:() -> Void?
    
    var body: some View {
        VStack(alignment:.leading,spacing: 0) {
            Text(placeHolder)
                .padding(.horizontal)
                .padding(.vertical,2)
            HStack {
                if (leftImage != nil) {
                    leftImage
                        .padding(.leading,10)
                        .frame(width: 30,height: 30)
                        .onTapGesture {
                            leftClick()
                        }
                }
                if isPassword {
                    if isSecure {
                        HStack {
                            SecureField("", text: $text)
                                .onChange(of: text) { newValue in
                                    isValid = newValue.isValid(validationType)
                                    print(isValid)
                                }.padding()
                            
                            Image(isSecure ? .eye : .eyeinvisible)
                                .resizable()
                                .frame(width: 50,height: 50)
                                .padding()
                                .onTapGesture {
                                    isSecure.toggle()
                                }
                        }
                        .padding(.vertical,2)
                    } else {
                        HStack {
                            TextField("", text: $text)
                                .onChange(of: text) { newValue in
                                    isValid = newValue.isValid(validationType)
                                }.padding()
                            
                            Image(isSecure ? .eye : .eyeinvisible)
                                .resizable()
                                .frame(width: 50,height: 50)
                                .padding()
                                .onTapGesture {
                                    isSecure.toggle()
                                }
                        }
                        .padding(.vertical,2)
                    }
                }
                else {
                    if leftImage != nil {
                        TextField("", text: $text)
                            .onChange(of: text) { newValue in
                                isValid = newValue.isValid(validationType)
                            }
                    } else {
                        TextField("", text: $text)
                            .padding()
                            .onChange(of: text) { newValue in
                                isValid = newValue.isValid(validationType)
                            }
                    }
                    
                }
                
                if (rightImage != nil) {
                    rightImage
                        .frame(width: 30,height: 30)
                        .onTapGesture {
                            rightClick()
                        }
                }
                
            }
            .frame(height: 65)
            .background(.gray.opacity(0.2))
            .cornerRadius(12)
            
            if isSubmitClick == true  {
                
                if isValid {
                    
                } else {
                    Text(errorMessage != nil ? errorMessage : "\(placeHolder) Not Valid")
                        .foregroundStyle(.red)
                        .padding(.horizontal)
                        .padding(.vertical,2)

                }
                
            } else {
                Text(text.count == 0 ? "" : isValid ? "" : errorMessage)
                    .foregroundStyle(.red)
                    .padding(.horizontal)
                    .padding(.vertical,2)

            }
            
            
        }
    }
}

#Preview {
    FloatingLabelInput(text: .constant(""), placeHolder: .constant("Name"), isValid: .constant(false),errorMessage: "", isSubmitClick:.constant(false), validationType: .alphabet) {} rightClick: {}
    
}
