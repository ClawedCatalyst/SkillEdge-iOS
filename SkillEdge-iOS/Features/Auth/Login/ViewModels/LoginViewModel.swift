//
//  LoginViewModel.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 24/11/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    
    func login() {
        LoginAction(
            parameters: LoginRequest(
                email: email,
                password: password
            )
        ).call { response in
            Auth.shared.setCredentials(
                access: response.token.access,
                refresh: response.token.refresh
            )
            self.isLoading.toggle()
        }
    }
}
