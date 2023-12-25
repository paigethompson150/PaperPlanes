//
//  ContentView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
            VStack {
                Spacer()
                CarouselView(imageNames: ["paperplane", "gma", "deliver"], carouselText: ["Welcome to Paper Plane. The app for anonymous, kind messages.", "Send your thoughts into the world", "Make connections with new friends"])
                Spacer()
                Button("Get Started") {
                    print("Hey")
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
