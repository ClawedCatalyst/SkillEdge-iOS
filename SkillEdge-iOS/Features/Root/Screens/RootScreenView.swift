//
//  RootScreenView.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 25/11/23.
//

import SwiftUI

struct RootScreenView: View {
    @EnvironmentObject var auth: Auth
    
    var body: some View {
        if auth.loggedIn {
            HomeScreenView()
        } else {
            onBoardingScreen()
        }
    }
}

#Preview {
    RootScreenView()
}
