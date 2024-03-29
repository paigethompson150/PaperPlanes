//
//  CarouselView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct CarouselView: View {
    var pages: [CarouselPage]
    var timer = Timer.publish(every: 6.0, on: .main, in:.common).autoconnect()
    
    @State private var selectedImageIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(0..<pages.count, id: \.self) { index in
                VStack {
                    Image("\(pages[index].imagePath)")
                        .resizable()
                        .tag(index)
                        .frame(width: 200, height: 200)
                    
                    Text("\(pages[index].desc)")
                        .foregroundColor(.white)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 50)
                }
                .frame(maxWidth: .infinity, minHeight: .infinity)
            }
        }
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
        .onDisappear {
            timer.upstream.connect().cancel()
        }
        
        // Pagination
        HStack {
            ForEach(0..<pages.count, id: \.self) { index in
                Capsule()
                    .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                    .frame(width: selectedImageIndex == index ? 20 : 10, height: 10)
                    .onTapGesture {
                        selectedImageIndex = index
                    }
                    .animation(.easeInOut, value: selectedImageIndex)
            }
            .offset(y: 100)
        }
        .onReceive(timer) { _ in
            selectedImageIndex = (selectedImageIndex+1)%pages.count
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let pages = [CarouselPage(desc: "test", imagePath: "paperplane"), CarouselPage(desc: "hey", imagePath:"gma")]
        
        ZStack{
            Color.blue
            CarouselView(pages: pages)
        }
    }
}
