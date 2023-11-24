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

    func login() {
        LoginAction(
            parameters: LoginRequest(
                email: email,
                password: password
            )
        ).call { response in
            Auth.shared.setCredentials(
                access: response.access,
                refresh: response.refresh
            )
        }
    }
}
