//
//  ResetOTPAction.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import Foundation

struct ResetOTPAction {
    
    var parameters: ResetOTPRequest
    
    func call(completion: @escaping (ResetOTPResponse) -> Void) {
        
        let url = URL(string: "http://127.0.0.1:8000/api/resend_otp/")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            // Error: Unable to encode request parameters
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                let response = try? JSONDecoder().decode(ResetOTPResponse.self, from: data)
                
                if let response = response {
                    completion(response)
                } else {
                    // Error: Unable to decode response JSON
                }
            } else {
                // Error: API request failed
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
