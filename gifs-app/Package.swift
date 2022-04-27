// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gifs-app",
    platforms: [
      .iOS(.v14)
    ],
    products: [
        .library(name: "Coordinator", targets: ["Coordinator"]),
        .library(name: "AppCore", targets: ["AppCore"]),
        .library(name: "SharedModels", targets: ["SharedModels"]),
        .library(name: "ApiClient", targets: ["ApiClient"]),
        .library(name: "ApiClientRoutes", targets: ["ApiClientRoutes"]),
        .library(name: "GifBrowser", targets: ["GifBrowser"]),
        .library(name: "GifDetails", targets: ["GifDetails"]),
        .library(name: "GifUI", targets: ["GifUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.34.0"),
        .package(url: "https://github.com/johnpatrickmorgan/TCACoordinators.git", from: "0.1.1"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "SharedModels",
            dependencies: []),
        .target(
            name: "AppCore",
            dependencies: []),
        .target(
            name: "Coordinator",
            dependencies: [
                "GifBrowser",
                "GifDetails",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "TCACoordinators", package: "TCACoordinators"),
            ]),
        .target(
            name: "ApiClient",
            dependencies: [
                "AppCore",
                "SharedModels",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]),
        .target(
            name: "ApiClientRoutes",
            dependencies: [
                "ApiClient",
                "SharedModels",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .target(
            name: "GifBrowser",
            dependencies: [
                "ApiClientRoutes",
                "GifUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")
            ]),
        .target(
            name: "GifDetails",
            dependencies: [
                "GifUI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")
            ]),
        .target(
            name: "GifUI",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")
            ]),
    ]
)

