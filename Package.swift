// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "MetaAdapter",
  platforms: [.iOS(.v15)],
  products: [
    .library(
      name: "MetaAdapterTarget",
      targets: ["MetaAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/facebook/FBAudienceNetwork.git",
      exact: "6.22.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.4.0"
    ),
  ],
  targets: [
    .target(
      name: "MetaAdapterTarget",
      dependencies: [
        .target(name: "MetaAdapter"),
        .product(name: "FBAudienceNetwork", package: "FBAudienceNetwork"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "MetaAdapterTarget",
      linkerSettings: [
        .linkedFramework("AppTrackingTransparency")
      ]
    ),
    .binaryTarget(
      name: "MetaAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/meta/MetaAdapter-6.22.0.0.zip",
      checksum: "f329ea5ceb98cd86f8517b16c5b66e8654799efc4127ecd34595c0eabe3b9bda"
    ),
  ]
)
