// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

/**
 * Copyright IBM Corporation 2016, 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import PackageDescription

let package = Package(
    name: "KituraStarter",
    products: [
      .library(
        name: "Kitura-Starter",
        targets:  ["Kitura-Starter", "Controller"]
      )
    ],
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "1.7.9")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMajor(from: "1.7.1")),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", .upToNextMajor(from: "4.0.5")),
      .package(url: "https://github.com/IBM-Bluemix/cf-deployment-tracker-client-swift.git", .upToNextMajor(from: "4.0.1")),
      .package(url: "https://github.com/IBM-Swift/Health.git", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
      .target(
        name: "Kitura-Starter",
        dependencies: ["Kitura", "HeliumLogger", "CloudFoundryDeploymentTracker", "Controller"]
      ),
      .target(
        name: "Controller",
        dependencies: ["Kitura", "CloudEnvironment", "Health"]
      ),
      .testTarget(
        name: "ControllerTests",
        dependencies: ["Controller"]
      )
    ]
)
