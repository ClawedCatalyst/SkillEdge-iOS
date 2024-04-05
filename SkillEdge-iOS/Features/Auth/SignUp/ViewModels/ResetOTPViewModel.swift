//
//  ResetOTPViewModel.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

class ResetOTPViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var error: APIError?
    
    func resetOtpfunc() {
        ResetOTPAction(
            parameters: ResetOTPRequest(email: email)
        ).call { response in
            // Response.
        }failure: { error in
            self.error = error
        }
    }
}
