//
//  ContentView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct IntroView: View {
    var pages = [
        CarouselPage(desc: "The app for anonymous, kind messages", imagePath: "paperplane"),
        CarouselPage(desc: "Connect with real people from around the world", imagePath:"gma"),
        CarouselPage(desc: "Express your feelings honestly, and without judgement", imagePath: "deliver")
    ]
    @State private var showIntro = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
            VStack {
                Spacer()
                Text("Paper Plane")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                CarouselView(pages: pages)
                Spacer()
                
                Button("Log In") {
                    
                }.buttonStyle(CustomButtonStyle())
                Divider()
                    .padding(5)
                Button("Sign Up") {
                    showIntro = true
                }.buttonStyle(CustomButtonStyle())
            }
            .padding(40)
        }
        .navigationDestination(isPresented: $showIntro) {
            WelcomeView()
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
