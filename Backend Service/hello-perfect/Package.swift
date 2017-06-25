// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "hello-perfect",
    dependencies: [
    .Package(url: "https://github.com/PerfectlySoft/Perfect-HttpServer.git", majorVersion: 2)
    ]
)
