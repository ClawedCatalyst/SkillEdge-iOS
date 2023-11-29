//
//  OTPAction.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

struct OTPAction {
    let path = "/otp_verify/"
    let method: HTTPMethod = .post
    var parameters: OTPRequest
    
    func call(
        completion: @escaping (OTPResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        APIRequest<OTPRequest, OTPResponse>.call(
            path: path,
            method: .post,
            parameters: parameters
        ) { data in
            if let response = try? JSONDecoder().decode(
                OTPResponse.self,
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
