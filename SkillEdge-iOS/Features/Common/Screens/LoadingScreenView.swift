//
//  LoadingScreenView.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 27/11/23.
//

import SwiftUI

struct LoadingScreenView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
                .opacity(0.5)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(3)
            
        }
    }
}

#Preview {
    LoadingScreenView()
}
