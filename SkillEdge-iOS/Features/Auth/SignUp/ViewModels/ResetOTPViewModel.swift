//
//  ResetOTPViewModel.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

class ResetOTPViewModel: ObservableObject {
    
    @Published var email: String = ""
    
    func resetOtpfunc() {
        ResetOTPAction(
            parameters: ResetOTPRequest(email: email)
        ).call { response in
            // Response.
        }
    }
}
