//
//  SignupRequest.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation


struct SignupRequest: Encodable {
    let name: String
    let email: String
    let password: String
    let user_name: String
}

