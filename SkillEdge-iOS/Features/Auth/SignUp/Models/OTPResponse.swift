//
//  OTPResponse.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

struct OTPResponse: Decodable {
    let token: Otptoken
    let msg: String
}

struct Otptoken: Decodable {
    let refresh: String
    let access: String
}
