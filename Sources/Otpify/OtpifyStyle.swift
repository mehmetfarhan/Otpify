//
//  OtpifyStyle.swift
//  Otpify
//
//  Created by Mohammad Farhan on 06/01/2025.
//

import SwiftUI

public struct OtpifyStyle {
    var fieldWidth: CGFloat = 50
    var fieldHeight: CGFloat = 50
    var font: Font = .system(size: 20, weight: .medium)
    var borderColor: Color = .gray
    var focusedBorderColor: Color = .black
    var borderWidth: CGFloat = 1
    var cornerRadius: CGFloat = 5
    var backgroundColor: Color = .white
    var spacing: CGFloat = 8
    
    public init(
        fieldWidth: CGFloat = 50,
        fieldHeight: CGFloat = 50,
        font: Font = .system(size: 20, weight: .medium),
        borderColor: Color = .gray,
        focusedBorderColor: Color = .black,
        borderWidth: CGFloat = 1,
        cornerRadius: CGFloat = 5,
        backgroundColor: Color = .white,
        spacing: CGFloat = 8
    ) {
        self.fieldWidth = fieldWidth
        self.fieldHeight = fieldHeight
        self.font = font
        self.borderColor = borderColor
        self.focusedBorderColor = focusedBorderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.spacing = spacing
    }
}
