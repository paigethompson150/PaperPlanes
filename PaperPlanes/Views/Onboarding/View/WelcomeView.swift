//
//  WelcomeView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/25/23.
//

import SwiftUI

struct WelcomeView: View {
    @State var selectedIndex: Int = 0
    var pages: [WelcomeTab] = [.one, .two, .three, .four, .five]
    var buttonText: [String] = ["Nice to meet you", "Cool!", "I'll do my best","I understand", "Let's go!"]
    
    @State var showPhoneVerification = false
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2)
            
            VStack{
                Image("gato")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)
                    .padding(.bottom, 30)
                    .padding(.top, 50)
                
                VStack{
                    WelcomeCarousel(selectedIndex: $selectedIndex, pages: pages)
                        .padding(.bottom, 60)
                    Button(buttonText[selectedIndex]){
                        withAnimation {
                            if selectedIndex == pages.count-1 {
                                showPhoneVerification = true
                            } else {
                                selectedIndex+=1
                            }
                        }
                    }.buttonStyle(CustomButtonStyle())
                }
                .padding(30)
                .background(.opacity(0.05))
                .cornerRadius(25)
            }
            .padding(40)
        }
        .ignoresSafeArea()
        .navigationDestination(isPresented: $showPhoneVerification) {
            PhoneVerificationView()
        }
    }
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView()
        }
    }
}


// Welcome Carousel View
struct WelcomeCarousel: View {
    @Binding var selectedIndex: Int
    var pages: [WelcomeTab]
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<pages.count, id: \.self) { index in
                VStack {
                    Text("\(pages[index].title)")
                        .font(.title2)
                        .bold()
                        
                    Text("\(pages[index].desc)")
                        .font(.title3)
                        .padding(.top, 10)
                        
                }
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
