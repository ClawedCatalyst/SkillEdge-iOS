//
//  OTPViewModel.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

class OTPViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var otp: String = ""
    @Published var success: Bool = false

    func otpfunc() {
        OTPAction(
            parameters: OTPRequest(email: email, otp: otp)
        ).call { response in
            print(response)
            if response.msg == "verification Successfull"{
                Auth.shared.setCredentials(
                    access: response.token.access,
                    refresh: response.token.refresh
                )
                self.success.toggle()
            }
        }
    }
}
