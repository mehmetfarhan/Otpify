// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Otpify",
    platforms: [
        .iOS(.v15) // Ensure iOS 15 or later
    ],
    products: [
        .library(
            name: "Otpify",
            targets: ["Otpify"]
        ),
    ],
    targets: [
        .target(
            name: "Otpify",
            dependencies: []
        ),
        .testTarget(
            name: "OtpifyTests",
            dependencies: ["Otpify"]
        ),
    ]
)
