# Otpify

[![Swift](https://img.shields.io/badge/Swift-5.5-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%20|%20macOS%20|%20watchOS%20|%20tvOS-blue)](https://developer.apple.com)
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](https://opensource.org/licenses/MIT)

**Otpify** is a lightweight, customizable, and easy-to-use SwiftUI library for OTP (One-Time Password) input fields. It supports dynamic OTP lengths, customizable styles, and automatic keyboard dismissal.

---

## Features

- **Dynamic OTP Length**: Set the number of OTP fields dynamically.
- **Customizable Styles**: Adjust the appearance of the OTP fields (width, height, font, colors, etc.).
- **Automatic Keyboard Dismissal**: The keyboard is dismissed automatically when the last field is filled.
- **Focus Handling**: Automatically moves focus between fields as the user types.
- **Input Validation**: Ensures only numeric input is allowed and limits each field to a single character.

---

## Installation

### Swift Package Manager

Add Otpify to your project using Swift Package Manager:

1. In Xcode, go to `File > Add Packages...`.
2. Enter the repository URL: `https://github.com/your-username/Otpify.git`.
3. Select the version you want to use.
4. Click `Add Package`.

---

## Usage

### Basic Usage

Here’s how you can use Otpify in your SwiftUI view:

```swift
import SwiftUI
import Otpify

struct ContentView: View {
    var body: some View {
        OtpifyView(
            otpLength: 6,
            style: OtpifyStyle(
                fieldWidth: 50,
                fieldHeight: 60,
                font: .system(size: 24, weight: .bold),
                borderColor: .blue,
                borderWidth: 2,
                cornerRadius: 10,
                backgroundColor: .gray.opacity(0.1),
                spacing: 12
            ),
            displayType: .circular,
            onComplete: { otp in
                print("Entered OTP: \(otp)")
                // Perform additional actions, such as OTP validation
            }
        )
        .padding()
    }
}
