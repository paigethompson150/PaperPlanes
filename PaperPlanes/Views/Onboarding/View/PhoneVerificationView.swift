//
//  PhoneVerificationView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/26/23.
//

import SwiftUI

struct PhoneVerificationView: View {
    @State private var phoneNumber: String = ""
    @State private var showMain: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Enter your phone number")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            
            HStack {
                Text("🇺🇸")
                TextField("", text: $phoneNumber,prompt: Text("(615) 975-3270)")
                )
                .font(.title2)
            }
            .padding()
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
            Text("We verify your number just to make sure you're human - you'll still be completely anonymous.")
                .opacity(0.4)
            
            Spacer()
            Button {
                //phone verification here
                showMain = true
            } label: {
                Text("Send Code")
            }
            .buttonStyle(CustomButtonStyle())
        }
        .padding(40)
        .background(Color.blue.opacity(0.2))
        .navigationDestination(isPresented: $showMain) {
            MainTabView()
        }
    }
}

struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}
