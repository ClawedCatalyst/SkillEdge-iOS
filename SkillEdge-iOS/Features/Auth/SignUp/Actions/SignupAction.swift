//
//  SignupAction.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

struct SignupAction {
    let path = "/new_user_registration/"
    let method: HTTPMethod = .post
    var parameters: SignupRequest
    
    func call(
        completion: @escaping (SignupResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        APIRequest<SignupRequest, SignupResponse>.call(
            path: path,
            method: .post,
            parameters: parameters
        ) { data in
            if let response = try? JSONDecoder().decode(
                SignupResponse.self,
                from: data
            ) {
                completion(response)
            } else {
                failure(.jsonDecoding)
            }
        }failure: { error in
            failure(error)
        }
    }
}
