//
//  PhoneVerificationView.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 12/26/23.
//
/*
 License for Country Code Picker:
 MIT License

 Copyright (c) 2022 Mobven

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 */

import SwiftUI
import FirebaseAuth

struct PhoneVerificationView: View {
    @State private var verificationCode: String = ""
    @State private var phoneNumber: String = ""
    @State private var selectedCountry: Country = Country(code: "",calling: "")
    private var countries = CountryCodesModel().countryDictionary
    
    // Navigation
    @State private var showCodeVerification: Bool = false
    @State var showingCountryPicker = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Enter your phone number")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            
            HStack {
                // MARK: Country Picker
                Button {
                    showingCountryPicker = true
                } label: {
                    HStack {
                        // MARK: Autofill with user's country if possible
                        Text(selectedCountry.code.flag())
                        Text("+"+selectedCountry.calling)
                    }
                }

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
                verifyPhoneNumber()
            } label: {
                Text("Send Code")
            }
            .buttonStyle(CustomButtonStyle())
        }
        .padding(40)
        .background(Color.blue.opacity(0.2))
        .onAppear {
            setDefaultCountry()
        }
        .sheet(isPresented: $showingCountryPicker) {
            CountryCodesView(selectedCountry: self.$selectedCountry)
        }
        .navigationDestination(isPresented: $showCodeVerification) {
            CodeVerificationView(phoneNumber: phoneNumber, verificationCode: verificationCode)
        }
    }
    
    
}

struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}

extension PhoneVerificationView {
    
    // MARK: Set user's default country to their locale
    func setDefaultCountry() {
        if selectedCountry.code == "" {
            for country in countries {
                if Locale.current.region?.identifier == country.code {
                    selectedCountry = country
                }
            }
        }
    }
}


extension PhoneVerificationView {
    
    // MARK: Phone Number Verification
    func verifyPhoneNumber() {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber("+"+selectedCountry.calling+phoneNumber, uiDelegate: nil) { verificationID, error in
              if let error = error {
                print(error.localizedDescription)
                return
              }
              verificationCode = verificationID!
              showCodeVerification = true
          }
    }
}
