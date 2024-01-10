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
            ProfileView()
                .tabItem {
                    Label("", systemImage: "person.crop.circle")
                }
            
            LettersListView()
                .tabItem {
                    Label("", systemImage: "envelope")
                }
            
            PlanesView()
                .tabItem {
                    Label("", systemImage: "paperplane")
                }
            
            HelpView()
                .tabItem {
                    Label("", systemImage: "questionmark.circle")
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
