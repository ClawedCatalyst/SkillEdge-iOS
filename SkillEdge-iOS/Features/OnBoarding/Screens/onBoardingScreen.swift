//
//  onBoardingScreen.swift
//  SkillEdge-iOS
//
//  Created by suhail ahmad on 19/11/23.
//

import SwiftUI

struct onBoardingScreen: View {
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State var navigated = false
    @State private var selection = 0
    
    let onBoardingImages = ["onBording1","onBoarding2","onBoarding3"]
    var body: some View {
        if navigated {
            LoginScreen()
        }
        else{
            VStack{
                TabView(selection: $selection){
                    ForEach(0..<3){ i in
                        Image(onBoardingImages[i])
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .onReceive(timer, perform: { _ in
                    withAnimation{
                        selection = selection < 3 ? selection + 1: 0
                    }
                })
                
                
                HStack{
                    NavigationLink(destination: LoginScreen()){
                        Button("Browse"){
                            // TODO: Add universal browse page
                        }
                        .frame(width: 150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .cornerRadius(10)
                        .ignoresSafeArea()
                    }
                    Button("Signin"){
                        self.navigated.toggle()
                    }
                    .frame(width: 150, height: 50)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(10)
                    .ignoresSafeArea()
                    
                }
            }
        }
    }
}

#Preview {
    onBoardingScreen()
}
