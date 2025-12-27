//
//  HomeView.swift
//  SecureScreenKitDemo
//

import SwiftUI
import SecureScreenKit

struct HomeView: View {
    @State private var isRecordingProtectionEnabled = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Hero Section
                    heroSection
                    
                    // Feature Cards
                    featureCardsSection
                    
                    // Recording Protection Toggle
                    recordingProtectionCard
                    
                    Spacer(minLength: 50)
                }
                .padding()
            }
            .background(
                LinearGradient(
                    colors: [Color.purple.opacity(0.1), Color.blue.opacity(0.05)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationTitle("SecureScreenKit")
        }
    }
    
    private var heroSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.purple, Color.blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: .purple.opacity(0.5), radius: 20, x: 0, y: 10)
                
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.white)
            }
            
            Text("Screen Protection")
                .font(.title.bold())
            
            Text("Protect your sensitive content from\nscreenshots and screen recordings")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 24)
    }
    
    private var featureCardsSection: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                FeatureCard(
                    icon: "camera.fill",
                    title: "Screenshot",
                    subtitle: "Use ScreenshotProofView",
                    color: .blue
                )
                
                FeatureCard(
                    icon: "video.fill",
                    title: "Recording",
                    subtitle: "Toggle below or overlay",
                    color: .green
                )
            }
        }
    }
    
    private var recordingProtectionCard: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Full App Recording Protection")
                        .font(.headline)
                    Text("Shows black overlay during recording")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Toggle("", isOn: $isRecordingProtectionEnabled)
                    .labelsHidden()
                    .tint(.purple)
                    .onChange(of: isRecordingProtectionEnabled) { newValue in
                        if newValue {
                            SecureScreenConfiguration.shared.enableFullAppProtection()
                        } else {
                            SecureScreenConfiguration.shared.disableFullAppProtection()
                        }
                    }
            }
            
            HStack {
                Image(systemName: isRecordingProtectionEnabled ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isRecordingProtectionEnabled ? .green : .red)
                
                Text(isRecordingProtectionEnabled ? "Recording protection enabled" : "Protection disabled")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }
}

// MARK: - Feature Card

struct FeatureCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(title)
                .font(.headline)
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
}

#Preview {
    HomeView()
}
