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
    @State private var isErrorToast: Bool = false
    @State private var isAllField: Bool = false
    @State private var isNecessaryField: Bool = false
    @FocusState private var isTextFieldFocused: Bool
    
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
                                .stroke(isNecessaryField && !isTextFieldFocused  ? Color.red : Color.clear, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                        .focused($isTextFieldFocused)
                    
                    TextField("Username", text: $viewModel.user_name)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .border(isNecessaryField ? Color.red : Color.clear, width: 1)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    TextField("Email ", text: $viewModel.email)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .border(isNecessaryField ? Color.red : Color.clear, width: 1)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    SecureField("Create Password", text: $viewModel.password)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .border(isNecessaryField ? Color.red : Color.clear, width: 1)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    SecureField("Repeat Password", text: $checkPassword)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .border(isNecessaryField ? Color.red : Color.clear, width: 1)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    
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
                        viewModel.isLoading.toggle()
                        
                        if viewModel.email == "" || viewModel.password == "" || viewModel.name == "" || viewModel.user_name == "" {
                            viewModel.errorMessage = "Please fill necessary details "
                            isErrorToast.toggle()
                            isNecessaryField.toggle()
                            viewModel.isLoading.toggle()
                        }
                        
                        if viewModel.error != nil {
                            isErrorToast.toggle()
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
            }.toast(isPresenting: $isErrorToast){
                return AlertToast(displayMode: .hud, type: .error(.red), title: viewModel.errorMessage)
            }
        }
    }
}

#Preview {
    SignUpScreenView()
}
