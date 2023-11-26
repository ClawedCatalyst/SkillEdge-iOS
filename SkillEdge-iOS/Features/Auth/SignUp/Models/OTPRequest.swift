//
//  OTPRequest.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

struct OTPRequest: Encodable {
    let email: String
    let otp: String
}
