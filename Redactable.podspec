Pod::Spec.new do |spec|
  spec.name         = "Redactable"
  spec.version      = "0.1.0"
  spec.summary      = "Shows a shimmer effect while loading data."
  spec.description  = <<-DESC
  A convenient library to show a shimmer effect while loading data. Easily convert your current view with a slick skeleton loading animation just by wrapping your view and conforming to a protocol.
                   DESC

  spec.homepage     = "https://github.com/JustinGuedes/redactable-ios"
  spec.screenshots  = "https://github.com/JustinGuedes/redactable-ios/blob/main/Example/example.gif?raw=true"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Justin Guedes" => "justin.guedes@gmail.com" }

  spec.swift_version = "5.5"
  spec.ios.deployment_target = "14.0"
  spec.osx.deployment_target = "11.0"

  spec.source       = { :git => "https://github.com/JustinGuedes/redactable-ios.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/Redactable", "Sources/Redactable/**/*.{swift}"

  spec.framework  = "SwiftUI"
end
