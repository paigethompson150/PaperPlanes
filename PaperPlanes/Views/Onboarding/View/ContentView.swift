//
//  ContentView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct ContentView: View {
    var pages = [CarouselPage(desc: "test", imagePath: "paperplane"), CarouselPage(desc: "hey", imagePath:"gma")]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
            VStack {
                Spacer()
                CarouselView(pages: pages)
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
