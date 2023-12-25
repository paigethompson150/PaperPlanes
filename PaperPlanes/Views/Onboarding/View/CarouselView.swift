//
//  CarouselView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct CarouselView: View {
    var imageNames: [String]
    var carouselText: [String]
    let timer = Timer.publish(every: 8.0, on: .main, in:.common).autoconnect()
    
    @State private var selectedImageIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(0..<imageNames.count, id: \.self) { index in
                VStack {
                    Image("\(imageNames[index])")
                        .resizable()
                        .tag(index)
                        .frame(width: 200, height: 200)
                    Text("\(carouselText[index])")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 250)
            }
        }
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
        
        // Pagination
        HStack {
            ForEach(0..<imageNames.count, id: \.self) { index in
                Capsule()
                    .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                    .frame(width: 8, height: 8)
                    .onTapGesture {
                        selectedImageIndex = index
                    }
            }
            .offset(y: 140)
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex+1)%imageNames.count
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(imageNames: ["paperplane", "paperplane", "paperplane"], carouselText: ["Hey", "Welcome", "Boo"])
    }
}
