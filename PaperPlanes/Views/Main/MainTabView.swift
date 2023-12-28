//
//  MainTabView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/27/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            IntroView()
                .tabItem {
                    Label("Msg", systemImage: "envelope")
                }
            
            WelcomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PhoneVerificationView()
                .tabItem {
                    Label("Hey", systemImage: "pencil.line")
                }
            
            PhoneVerificationView()
                .tabItem {
                    Label("test", systemImage: "questionmark.circle")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
