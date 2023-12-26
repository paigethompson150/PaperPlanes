//
//  ContentView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct ContentView: View {
    var pages = [
        CarouselPage(desc: "The app for anonymous, kind messages", imagePath: "paperplane"),
        CarouselPage(desc: "Connect with real people from around the world", imagePath:"gma"),
        CarouselPage(desc: "Express your feelings honestly, without judgement", imagePath: "deliver")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
            VStack {
                Spacer()
                CarouselView(pages: pages)
                Spacer()
                
                Button("Get Started") {
                    print("Hey")
                }.buttonStyle(CustomButtonStyle())
            }
            .padding(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
