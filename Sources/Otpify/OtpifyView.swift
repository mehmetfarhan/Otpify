//
//  OtpifyView.swift
//  Otpify
//
//  Created by Mohammad Farhan on 06/01/2025.
//


import SwiftUI
import Combine

// MARK: - OtpifyView
public struct OtpifyView: View {
    @State private var otpFields: [String]
    @FocusState private var focusedField: Int?
    var style: OtpifyStyle
    var displayType: DisplayType
    var onComplete: (String) -> Void // Completion handler
    
    public init(
        otpLength: Int = 4,
        style: OtpifyStyle = OtpifyStyle(),
        displayType: DisplayType = .roundedCorner,
        onComplete: @escaping (String) -> Void = { _ in } // Default empty handler
    ) {
        self._otpFields = State(initialValue: Array(repeating: "", count: otpLength))
        self.style = style
        self.displayType = displayType
        self.onComplete = onComplete
    }
    
    public var body: some View {
        HStack(spacing: style.spacing) {
            ForEach(0..<otpFields.count, id: \.self) { index in
                OtpifyField(
                    text: $otpFields[index],
                    isFocused: focusedField == index,
                    onTextChange: { _, isForward in
                        handleTextChange(fieldIndex: index, isForward: isForward)
                    },
                    style: style,
                    displayType: displayType
                )
                .focused($focusedField, equals: index)
            }
        }
        .onAppear {
            focusedField = 0
        }
        .onChange(of: otpFields) { _ in
            checkIfLastFieldIsFilled()
        }
    }
    
    private func handleTextChange(fieldIndex: Int, isForward: Bool) {
        if isForward {
            if fieldIndex < otpFields.count - 1 {
                focusedField = fieldIndex + 1
            }
        } else {
            if fieldIndex > 0 {
                focusedField = fieldIndex - 1
            }
        }
    }
    
    private func checkIfLastFieldIsFilled() {
        // Check if the last field is filled
        if let lastFieldIndex = otpFields.lastIndex(where: { !$0.isEmpty }),
           lastFieldIndex == otpFields.count - 1 {
            // Dismiss the keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            
            // Notify the parent view with the complete OTP
            onComplete(otpFields.joined())
        }
    }
}

// MARK: - OtpifyField
public struct OtpifyField: View {
    @Binding var text: String
    let isFocused: Bool
    var onTextChange: (String, Bool) -> Void
    var style: OtpifyStyle
    var displayType: DisplayType
    
    public init(
        text: Binding<String>,
        isFocused: Bool,
        onTextChange: @escaping (String, Bool) -> Void,
        style: OtpifyStyle = OtpifyStyle(),
        displayType: DisplayType = .roundedCorner
    ) {
        self._text = text
        self.isFocused = isFocused
        self.onTextChange = onTextChange
        self.style = style
        self.displayType = displayType
    }
    
    public var body: some View {
        TextField("", text: $text)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: style.fieldWidth, height: style.fieldHeight)
            .font(style.font)
            .background(style.backgroundColor)
            .cornerRadius(displayType == .circular ? style.fieldHeight / 2 : style.cornerRadius)
            .overlay(
                Group {
                    switch displayType {
                    case .circular, .roundedCorner, .square:
                        RoundedRectangle(cornerRadius: displayType == .circular ? style.fieldHeight / 2 : style.cornerRadius)
                            .stroke(isFocused ? style.focusedBorderColor : style.borderColor, lineWidth: style.borderWidth)
                    case .underlinedBottom:
                        Rectangle()
                            .frame(height: style.borderWidth)
                            .foregroundColor(isFocused ? style.focusedBorderColor : style.borderColor)
                            .offset(y: style.fieldHeight / 2)
                    }
                }
            )
            .onChange(of: text) { newValue in
                let filtered = newValue.filter { $0.isNumber }
                
                if filtered.count > 1 {
                    text = String(filtered.prefix(1))
                } else {
                    text = filtered
                }
                
                if !text.isEmpty {
                    onTextChange(text, true)
                } else if text.isEmpty && newValue.isEmpty {
                    onTextChange(text, false)
                }
            }
    }
}
