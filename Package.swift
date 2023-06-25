// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AnsiStyle",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "AnsiStyle",
      targets: ["AnsiStyle"]),
    .executable(name: "AnsiStyleExample", targets: ["AnsiStyleExample"]),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "AnsiStyle"),
    .executableTarget(name: "AnsiStyleExample", dependencies: ["AnsiStyle"]),
    .testTarget(
      name: "AnsiStyleTests",
      dependencies: ["AnsiStyle"]),
  ]
)
