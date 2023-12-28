//
//  CodeVerificationView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/27/23.
//

import SwiftUI

struct CodeVerificationView: View {
    @State private var verficationCode: String = ""
    @State private var login: Bool = false
    @State private var timeRemaining = 30
    
    @State var timer = Timer.publish(every: 1.0, on: .main, in:.common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Text("Enter the code we sent you")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            
            HStack {
                TextField("", text: $verficationCode, prompt: Text("1111")
                )
                .font(.title2)
            }
            .padding()
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
            Text("We verify your number just to make sure you're human - you'll still be completely anonymous.")
                .opacity(0.4)
            
            Spacer()
            HStack {
                Text("\(timeRemaining == 0 ? "" : String(timeRemaining))")

                Text("Resend verification?")
                    .allowsHitTesting(timeRemaining == 0 ? true : false)
                    .onTapGesture {
                        //resend code w/ phone number
                        
                        timeRemaining = 30
                        self.timer = Timer.publish(every: 1.0, on: .main, in:.common).autoconnect()
                    }
            }
            
            Button {
                //phone verification here
                login = true
            } label: {
                Text("Send Code")
            }
            .buttonStyle(CustomButtonStyle())
        }
        .padding(40)
        .background(Color.blue.opacity(0.2))
        .navigationDestination(isPresented: $login) {
            MainTabView()
        }
        .onReceive(timer) { _ in
            timeRemaining-=1
            if timeRemaining == 0 {
                timer.upstream.connect().cancel()
            }
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
}

struct CodeVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        CodeVerificationView()
    }
}
