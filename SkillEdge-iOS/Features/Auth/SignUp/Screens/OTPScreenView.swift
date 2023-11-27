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
    @State private var isTimerRunning = true
    @State private var secondsRemaining = 60
    @State private var initialCall: Bool = true
    @ObservedObject var viewModel: OTPViewModel = OTPViewModel()
    @ObservedObject var ResetviewModel: ResetOTPViewModel = ResetOTPViewModel()
    
    var body: some View {
        
        if viewModel.success {
            LoginScreen()
        }
        else{
            ZStack{
                VStack {
                    HStack{
                        Image("skillEdgeDarkLogo")
                            .resizable()
                            .frame(width: 48, height: 48)
                        
                        Text("Skill Edge")
                            .font(.system(size: 30, weight: .medium))
                    }.padding(.top, 50)
                    
                    
                    Text("Enter OTP")
                        .font(.system(size: 20))
                        .padding(.top, 30)
                    
                    OtpView(activeIndicatorColor: Color.black, inactiveIndicatorColor: Color.gray,  length: 4, doSomething: { value in
                        otpField = value
                    })
                    
                    HStack{
                        
                        Text("Didn’t get OTP ?")
                        
                        
                        Button(action: {
                            if !isTimerRunning{
                                startTimer()
                                ResetviewModel.email = Auth.shared.getSignUpEmail().email ?? ""
                                ResetviewModel.resetOtpfunc()
                            }
                        }) {
                            Text("Resend OTP")
                        }
                        .font(.system(size: 15))
                        .disabled(isTimerRunning)
                        
                        if isTimerRunning {
                            Text("\(secondsRemaining)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    
                    
                    Button("Verify"){
                        viewModel.email = Auth.shared.getSignUpEmail().email ?? ""
                        viewModel.otp = otpField
                        viewModel.otpfunc()
                        viewModel.isLoading.toggle()
                    }
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628))
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(10)
                    
                    
                    
                    Spacer()
                }.onAppear {
                    startTimer()
                }
            }
            if viewModel.isLoading {
                LoadingScreenView()
            }
        }
    }
    private func startTimer() {
        isTimerRunning = true
        initialCall = false
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                timer.invalidate()
                isTimerRunning = false
                secondsRemaining = 60
            }
        }
    }
}

#Preview {
    OTPScreenView()
}
