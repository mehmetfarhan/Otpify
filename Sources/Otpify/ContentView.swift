//
//  ContentView.swift
//  Otpify
//
//  Created by Mohammad Farhan on 06/01/2025.
//


import SwiftUI

struct ContentView: View {
    @State private var otp: String = ""
    
    var body: some View {
        VStack {
            OtpifyView(
                style: OtpifyStyle(
                    fieldWidth: 50,
                    fieldHeight: 50,
                    font: .system(size: 24, weight: .bold),
                    borderColor: .blue,
                    borderWidth: 1,
                    cornerRadius: 10,
                    spacing: 12
                ),
                displayType: .underlinedBottom,
                onComplete: { otp in
                    self.otp = otp
                }
            )
            .padding()
            
            Button("Submit") {
                print("Submitted OTP: \(otp)")
            }
        }
    }
}

#Preview {
    ContentView()
}
