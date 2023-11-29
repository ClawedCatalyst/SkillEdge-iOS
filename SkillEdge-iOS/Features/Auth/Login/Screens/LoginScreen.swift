//
//  LoginScreen.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 20/11/23.
//

import SwiftUI
import AlertToast

struct LoginScreen: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @EnvironmentObject var auth: Auth
    @State private var isSignUpBtnClicked: Bool = false
    @State private var isErrorToast: Bool = false
    
    var body: some View {
        if isSignUpBtnClicked{
            SignUpScreenView()
        }
        else if auth.loggedIn{
            HomeScreenView()
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
                    
                    Spacer()
                    
                    Text("Sign In to your Account")
                        .font(.system(size: 24))
                        .ignoresSafeArea()
                        .padding()
                    
                    
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    
                    Button("Forget Your Password"){
                        // TODO: add forget pass API
                    }
                    .frame(alignment: .leading)
                    .ignoresSafeArea()
                    .padding(.bottom, 30)
                    
                    Button("Sign In"){
                        viewModel.login()
                        viewModel.isLoading.toggle()
                        if viewModel.error != nil {
                            isErrorToast.toggle()
                        }
                    }
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628))
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    Text("Don’t have an account? ")
                    Button("Sign Up"){
                        isSignUpBtnClicked.toggle()
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
                AlertToast(displayMode: .hud, type: .error(.red), title: "Invalid credentials")
            }
        }
    }
}

#Preview {
    LoginScreen()
}
