//
//  LoginResponse.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 24/11/23.
//

import Foundation

struct LoginResponse: Decodable {
    let token: token
}

struct token: Decodable {
    let refresh: String
    let access: String
}
