// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UISystemModule",
    platforms: [
        .iOS(.v16)],
    products: [
        .library(
            name: "UISystemModule",
            targets: ["UISystemModule"]),
    ],
    targets: [
        .target(
            name: "UISystemModule"),
        .testTarget(
            name: "UISystemModuleTests",
            dependencies: ["UISystemModule"]),
    ]
)
