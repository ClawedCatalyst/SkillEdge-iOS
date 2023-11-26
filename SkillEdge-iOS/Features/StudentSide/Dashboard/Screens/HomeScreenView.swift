//
//  HomeScreenView.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 25/11/23.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            Button("Log Out"){
                viewModel.logout()
            }
            .frame(width: 300, height: 50)
            .background(Color.white)
            .foregroundColor(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628))
            .font(.system(size: 18, weight: .bold))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.0039215686, green: 0.7725490196078432, blue: 0.6509803921568628), lineWidth: 2)
            )
            
        }
    }
}

#Preview {
    HomeScreenView()
}
