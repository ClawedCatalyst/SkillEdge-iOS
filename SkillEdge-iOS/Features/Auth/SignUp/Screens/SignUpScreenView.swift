//
//  SignUpScreenView.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 26/11/23.
//

import SwiftUI
import AlertToast

struct SignUpScreenView: View {
    
    @ObservedObject var viewModel: SignupViewModel = SignupViewModel()
    @State private var checkPassword: String = ""
    @State private var isLoginBtnClick: Bool = false
    @State private var isAllField: Bool = false
    @State private var isNecessaryNameField: Bool = false
    @State private var isNecessaryEmailField: Bool = false
    @State private var isNecessaryUserNameField: Bool = false
    @State private var isNecessaryPasswordField: Bool = false
    @State private var isNecessaryChangePasswordField: Bool = false
    @FocusState private var isNameFieldFocused: Bool
    @FocusState private var isUserNameFieldFocused: Bool
    @FocusState private var isEmailFieldFocused: Bool
    @FocusState private var isPasswordFieldFocused: Bool
    @FocusState private var isChangePasswordFieldFocused: Bool
    
    var body: some View {
        
        if isLoginBtnClick {
            LoginScreen()
        }
        else if viewModel.success {
            OTPScreenView()
        }
        else{
            ZStack{
                VStack{
                    HStack{
                        Image("skillEdgeDarkLogo")
                            .resizable()
                            .frame(width: 48, height: 48)
                        
                        Text("Skill Edge")
                            .font(.system(size: 30, weight: .medium))
                    }.padding(.top, 50)
                    
                    Text("Create your Account")
                        .font(.system(size: 24))
                        .ignoresSafeArea()
                        .padding()
                    
                    
                    TextField("Full Name", text: $viewModel.name)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isNecessaryNameField && !isNameFieldFocused && viewModel.name == "" ? Color.red : Color.clear, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                        .focused($isNameFieldFocused)
                    
                    TextField("Username", text: $viewModel.user_name)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isNecessaryUserNameField && !isUserNameFieldFocused &&
                                        viewModel.user_name == "" ? Color.red : Color.clear, lineWidth: 1)
                        )
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .focused($isUserNameFieldFocused)
                    
                    TextField("Email ", text: $viewModel.email)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isNecessaryEmailField && !isEmailFieldFocused && viewModel.email == "" ? Color.red : Color.clear, lineWidth: 1)
                        )
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .focused($isEmailFieldFocused)
                    
                    SecureField("Create Password", text: $viewModel.password)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isNecessaryPasswordField && !isPasswordFieldFocused && viewModel.password == "" ? Color.red : Color.clear, lineWidth: 1)
                        )
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .focused($isPasswordFieldFocused)
                    
                    SecureField("Repeat Password", text: $checkPassword)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isNecessaryChangePasswordField && !isChangePasswordFieldFocused && checkPassword == ""  ? Color.red : Color.clear, lineWidth: 1)
                        )
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .focused($isChangePasswordFieldFocused)
                    
                    
                    if viewModel.password != checkPassword{
                        Text("Password does not match")
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                    }
                    else{
                        Text("   ")
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                    }
                    
                    
                    Button("Sign Up"){
                        viewModel.SignUp()
                        
                        if viewModel.name == ""{
                            viewModel.errorMessage = "Please fill necessary details "
                            viewModel.isErrorToast.toggle()
                            isNecessaryNameField.toggle()
                        }
                        if viewModel.user_name == ""{
                            viewModel.errorMessage = "Please fill necessary details "
                            viewModel.isErrorToast.toggle()
                            isNecessaryUserNameField.toggle()
                        }
                        if viewModel.email == ""{
                            viewModel.errorMessage = "Please fill necessary details "
                            viewModel.isErrorToast.toggle()
                            isNecessaryEmailField.toggle()
                        }
                        if viewModel.password == ""{
                            viewModel.errorMessage = "Please fill necessary details "
                            viewModel.isErrorToast.toggle()
                            isNecessaryPasswordField.toggle()
                        }
                        if checkPassword == ""{
                            viewModel.errorMessage = "Please fill necessary details "
                            viewModel.isErrorToast.toggle()
                            isNecessaryChangePasswordField.toggle()
                        }
                        
                        if viewModel.email != "" && viewModel.password != "" && viewModel.name != "" && viewModel.user_name != "" {
                            viewModel.isLoading.toggle()
                        }
                        
                        if viewModel.error != nil {
                            viewModel.isErrorToast.toggle()
                        }
                    }.disabled(isAllField)
                        .frame(width: 300, height: 50)
                        .background(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628))
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .cornerRadius(10)
                    
                    Spacer()
                    
                    Text("Already have an account? ")
                    Button("Sign In"){
                        isLoginBtnClick.toggle()
                    }
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628))
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628), lineWidth: 2)
                    )
                    
                    Spacer()
                }
                if viewModel.isLoading {
                    LoadingScreenView()
                }
            }.toast(isPresenting: $viewModel.isErrorToast){
                return AlertToast(displayMode: .hud, type: .error(.red), title: viewModel.errorMessage)
            }
        }
    }
}

#Preview {
    SignUpScreenView()
}
