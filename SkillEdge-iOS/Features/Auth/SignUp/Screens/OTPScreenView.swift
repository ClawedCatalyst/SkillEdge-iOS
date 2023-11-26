//
//  OTPScreenView.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import SwiftUI
import OTPView

struct OTPScreenView: View {
    @State var isFocused = false
    @State private var otp1: String = ""
    @State private var otp2: String = ""
    @State private var otp3: String = ""
    @State private var otp4: String = ""
    @State private var otpField: String = ""
    @State private var isTextFieldDisabled: Bool = false
    @ObservedObject var viewModel: OTPViewModel = OTPViewModel()
      
    var body: some View {
        
        if viewModel.success {
            LoginScreen()
        }
        else{
            
            VStack {
                
                HStack{
                    Image("skillEdgeDarkLogo")
                        .resizable()
                        .frame(width: 48, height: 48)
                    
                    Text("Skill Edge")
                        .font(.system(size: 30, weight: .medium))
                }.padding(.top, 50)
                
                Spacer()
                
                Text("Enter OTP")
                    .font(.system(size: 24))
                
                OtpView(activeIndicatorColor: Color.black, inactiveIndicatorColor: Color.gray,  length: 4, doSomething: { value in
                    otpField = value
                })
                .padding()
                
                
                
                Button("Verify"){
                    viewModel.email = Auth.shared.getSignUpEmail().email ?? ""
                    viewModel.otp = otpField
                    viewModel.otpfunc()
                }
                .frame(width: 300, height: 50)
                .background(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628))
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold))
                .cornerRadius(10)
                
                Text("Didn’t get OTP ? Resend OTP  0:59 ")
                    .padding()
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    OTPScreenView()
}

