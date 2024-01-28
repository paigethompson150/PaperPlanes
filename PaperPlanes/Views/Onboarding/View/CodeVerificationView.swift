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
    @State private var enableLoginView: Bool = false
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
                Text("\(formatTimeRemaining())")

                Text("Resend verification?")
                    .allowsHitTesting(timeRemaining == 0 ? true : false)
                    .onTapGesture {
                        resendVerification()
                        createNewTimer()
                    }
            }
            
            Button {
                enableLoginView = verifyUserCode()
            } label: {
                Text("Confirm")
            }
            .buttonStyle(CustomButtonStyle())
        }
        .padding(40)
        .background(Color.blue.opacity(0.2))
        .navigationDestination(isPresented: $enableLoginView) {
            MainTabView()
        }
        .onReceive(timer) { _ in
            decrementTimer()
        }
        .onDisappear {
            cancelTimer()
        }
    }
}



// MARK: Timer handling
extension CodeVerificationView {
    
    func decrementTimer() {
        timeRemaining-=1
        if timeRemaining == 0 {
            cancelTimer()
        }
    }
    
    func cancelTimer() {
        timer.upstream.connect().cancel()
    }
    
    func createNewTimer() {
        timeRemaining = 30
        self.timer = Timer.publish(every: 1.0, on: .main, in:.common).autoconnect()
    }
    
    func formatTimeRemaining() -> String {
        if timeRemaining == 0 { return "" }
        return String(timeRemaining)
    }
}

// MARK: Verification handling
extension CodeVerificationView {

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
    
    func verifyUserCode() -> Bool {
        if userVerificationInput == verificationCode { return true }
        return false
    }
}
