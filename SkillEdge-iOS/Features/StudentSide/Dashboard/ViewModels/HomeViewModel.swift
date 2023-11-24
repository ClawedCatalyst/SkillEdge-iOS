//
//  HomeViewModel.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 25/11/23.
//

import Foundation

class HomeViewModel: ObservableObject {

    func logout() {
        Auth.shared.logout()
    }
}
