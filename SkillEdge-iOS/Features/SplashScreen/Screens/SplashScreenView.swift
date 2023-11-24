//
//  SplashScreenView.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 19/11/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if self.isActive{
            RootScreenView()
                .environmentObject(Auth.shared)
        }
        else{
            VStack{
                VStack{
                    Image("skillEdgeDarkLogo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
