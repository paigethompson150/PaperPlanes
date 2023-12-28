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
                    Label("Msg", systemImage: "tray.and.arrow.down.fill")
                }
            
            WelcomeView()
                .tabItem {
                    Label("Home", systemImage: "tray.and.arrow.up.fill")
                }
            
            PhoneVerificationView()
                .tabItem {
                    Label("Hey", systemImage: "tray.and.arrow.down.fill")
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
