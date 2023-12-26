//
//  WelcomeView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct WelcomeView: View {
    @State var selectedIndex: Int = 0
    var pages: [CarouselPage] = [CarouselPage(desc: "test", imagePath: "paperplane"), CarouselPage(desc: "test2", imagePath: "paperplane"), CarouselPage(desc: "test3", imagePath: "paperplane")]
    
    var body: some View {
        ZStack {
            Color.pink
            
            VStack{
                Image("gato")
                    .frame(width: 3)
                
                VStack{
                    WelcomeCarousel(selectedIndex: $selectedIndex, pages: pages)
                    Button("I understand"){
                        withAnimation {
                            if selectedIndex != pages.count-1 {
                                selectedIndex+=1
                            }
                        }
                    }.buttonStyle(CustomButtonStyle()).padding(20)
                }
                .background(.opacity(0.3))
                .cornerRadius(25)
            }
            .padding(40)
        }
        .ignoresSafeArea()
    }
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView()
        }
    }
}

struct WelcomeCarousel: View {
    @Binding var selectedIndex: Int
    var pages: [CarouselPage]
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<pages.count, id: \.self) { index in
                VStack {
                    Text("\(pages[index].desc)")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
