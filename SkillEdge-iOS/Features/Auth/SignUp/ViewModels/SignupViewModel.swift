//
//  SignupViewModel.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

class SignupViewModel: ObservableObject {
    
    @Published var user_name: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var success = false
    @Published var isLoading = false
    
    func SignUp() {
        SignupAction(
            parameters: SignupRequest(
                name: name, email: email, password: password, user_name: user_name
            )
        ).call { response in
            if response.msg == "success"{
                Auth.shared.setSignUpEmail(email: self.email)
                self.success.toggle()
                self.isLoading.toggle()
            }
        }
    }
}
