//
//  CodeVerificationView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/27/23.
//

import SwiftUI
import FirebaseAuth

struct CodeVerificationView: View {
    var phoneNumber: String
    @State var verificationCode: String
    @State private var userVerificationInput: String = ""
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
                TextField("", text: $userVerificationInput, prompt: Text("1111")
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
                        resendVerification()
                        timeRemaining = 30
                        self.timer = Timer.publish(every: 1.0, on: .main, in:.common).autoconnect()
                    }
            }
            
            Button {
                if verifyVerificationId() { login = true }
                else { print("incorrect verification id")}
            } label: {
                Text("Confirm")
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
    
    func resendVerification() {
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
              if let error = error {
                print(error.localizedDescription)
                return
              }
              verificationCode = verificationID!
          }
    }
    
    func verifyVerificationId() -> Bool {
        if userVerificationInput == verificationCode { return true }
        return false
    }
    
    
}
