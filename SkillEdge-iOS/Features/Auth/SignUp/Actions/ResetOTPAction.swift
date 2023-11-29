//
//  ResetOTPAction.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

struct ResetOTPAction {
    let path = "/resend_otp/"
    let method: HTTPMethod = .post
    var parameters: ResetOTPRequest
    
    func call(
        completion: @escaping (ResetOTPResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        APIRequest<ResetOTPRequest, ResetOTPResponse>.call(
            path: path,
            method: .post,
            parameters: parameters
        ) { data in
            if let response = try? JSONDecoder().decode(
                ResetOTPResponse.self,
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

