//
//  SecureScreenKitDemoApp.swift
//  SecureScreenKitDemo
//
//  A beautiful demo app for SecureScreenKit
//

import SwiftUI
import SecureScreenKit

@main
struct SecureScreenKitDemoApp: App {
    
    init() {
        configureApp()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func configureApp() {
        // Setup violation handler for logging
        SecureScreenConfiguration.shared.violationHandler = BlockViolationHandler(
            onCaptureStarted: { print("🔴 Recording started") },
            onCaptureStopped: { print("🟢 Recording stopped") },
            onScreenshot: { print("📸 Screenshot taken") }
        )
    }
}
