//
//  SettingsView.swift
//  SecureScreenKitDemo
//

import SwiftUI
import SecureScreenKit

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                // MARK: - Capabilities Overview
                Section {
                    CapabilityRow(
                        icon: "camera.fill",
                        iconColor: .blue,
                        title: "Screenshot Protection",
                        description: "Hide content from screenshots"
                    )
                    
                    CapabilityRow(
                        icon: "video.fill",
                        iconColor: .green,
                        title: "Recording Protection",
                        description: "Show overlay during recordings"
                    )
                    
                    CapabilityRow(
                        icon: "lock.shield.fill",
                        iconColor: .purple,
                        title: "Complete Protection",
                        description: "Both screenshot & recording"
                    )
                } header: {
                    Text("Capabilities")
                }
                
                // MARK: - Documentation
                Section {
                    NavigationLink {
                        ScreenshotInfoView()
                    } label: {
                        DocumentationRow(
                            icon: "doc.text.fill",
                            title: "Screenshot Protection",
                            subtitle: "ScreenshotProofView"
                        )
                    }
                    
                    NavigationLink {
                        RecordingInfoView()
                    } label: {
                        DocumentationRow(
                            icon: "doc.text.fill",
                            title: "Recording Protection",
                            subtitle: "RecordingOverlayContainer"
                        )
                    }
                    
                    NavigationLink {
                        CompleteInfoView()
                    } label: {
                        DocumentationRow(
                            icon: "doc.text.fill",
                            title: "Complete Protection",
                            subtitle: "ScreenProtectedView"
                        )
                    }
                } header: {
                    Text("Documentation")
                }
                
                // MARK: - Quick Integration
                Section {
                    NavigationLink {
                        QuickStartView()
                    } label: {
                        HStack {
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.orange)
                            Text("Quick Start Guide")
                        }
                    }
                } header: {
                    Text("Getting Started")
                }
                
                // MARK: - About
                Section {
                    HStack {
                        Text("Library")
                        Spacer()
                        Text("SecureScreenKit")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("iOS Requirement")
                        Spacer()
                        Text("15.0+")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Swift")
                        Spacer()
                        Text("5.9+")
                            .foregroundColor(.secondary)
                    }
                } header: {
                    Text("About")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

// MARK: - Capability Row

struct CapabilityRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(iconColor.opacity(0.15))
                    .frame(width: 36, height: 36)
                
                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundColor(iconColor)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline.weight(.medium))
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Documentation Row

struct DocumentationRow: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fontDesign(.monospaced)
            }
        }
    }
}

// MARK: - Quick Start View

struct QuickStartView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Step 1
                StepCard(
                    number: 1,
                    title: "Add the Package",
                    code: """
                    // File > Add Package Dependencies
                    // Enter the repository URL
                    """
                )
                
                // Step 2
                StepCard(
                    number: 2,
                    title: "Import SecureScreenKit",
                    code: """
                    import SecureScreenKit
                    """
                )
                
                // Step 3
                StepCard(
                    number: 3,
                    title: "Protect Your Content",
                    code: """
                    // For screenshots only:
                    ScreenshotProofView {
                        YourSensitiveContent()
                    }
                    
                    // For recordings only:
                    RecordingOverlayContainer {
                        YourSensitiveContent()
                    }
                    
                    // For BOTH:
                    ScreenProtectedView {
                        YourSensitiveContent()
                    }
                    """
                )
                
                // Tips
                VStack(alignment: .leading, spacing: 12) {
                    Text("💡 Tips")
                        .font(.headline)
                    
                    TipRow(text: "Use .screenshotProtected() modifier for quick protection")
                    TipRow(text: "Wrap only sensitive content, not entire screens")
                    TipRow(text: "Test on a real device - simulators don't trigger protection")
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Quick Start")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StepCard: View {
    let number: Int
    let title: String
    let code: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.accentColor)
                        .frame(width: 28, height: 28)
                    Text("\(number)")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                }
                Text(title)
                    .font(.headline)
            }
            
            Text(code)
                .font(.system(.caption, design: .monospaced))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }
}

struct TipRow: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
            Text(text)
                .font(.subheadline)
        }
    }
}

// MARK: - Info Views

struct ScreenshotInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                InfoHeader(
                    icon: "camera.fill",
                    color: .blue,
                    title: "Screenshot Protection",
                    description: "Content wrapped in ScreenshotProofView will be invisible in screenshots."
                )
                
                CodeExample(
                    title: "SwiftUI View",
                    code: """
                    ScreenshotProofView {
                        Text("Hidden from screenshots")
                    }
                    """
                )
                
                CodeExample(
                    title: "View Modifier",
                    code: """
                    Text("Secret PIN: 1234")
                        .screenshotProtected()
                    """
                )
                
                InfoNote(text: "Uses iOS's secure text field technique. Content appears normally on screen but is blank in captures.")
            }
            .padding()
        }
        .navigationTitle("Screenshots")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecordingInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                InfoHeader(
                    icon: "video.fill",
                    color: .green,
                    title: "Recording Protection",
                    description: "Shows a customizable overlay when screen recording is detected."
                )
                
                CodeExample(
                    title: "Blur Overlay",
                    code: """
                    RecordingOverlayContainer(
                        policy: .obscure(style: .blur(radius: 25))
                    ) {
                        SensitiveContent()
                    }
                    """
                )
                
                CodeExample(
                    title: "Blackout Overlay",
                    code: """
                    RecordingOverlayContainer(
                        policy: .obscure(style: .blackout)
                    ) {
                        SensitiveContent()
                    }
                    """
                )
                
                CodeExample(
                    title: "Block with Message",
                    code: """
                    RecordingOverlayContainer(
                        policy: .block(reason: "Recording not allowed")
                    ) {
                        SensitiveContent()
                    }
                    """
                )
                
                InfoNote(text: "Detection happens in real-time. The overlay appears instantly when recording starts.")
            }
            .padding()
        }
        .navigationTitle("Recording")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CompleteInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                InfoHeader(
                    icon: "lock.shield.fill",
                    color: .purple,
                    title: "Complete Protection",
                    description: "Combines both screenshot and recording protection in one view."
                )
                
                CodeExample(
                    title: "View Wrapper",
                    code: """
                    ScreenProtectedView(
                        recordingPolicy: .obscure(style: .blackout)
                    ) {
                        BankAccountView()
                    }
                    """
                )
                
                CodeExample(
                    title: "View Modifier",
                    code: """
                    SecretDataView()
                        .screenProtected()
                    """
                )
                
                InfoNote(text: "Best for highly sensitive content like financial data, passwords, or personal information.")
            }
            .padding()
        }
        .navigationTitle("Complete")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Shared Components

struct InfoHeader: View {
    let icon: String
    let color: Color
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color.opacity(0.15))
                        .frame(width: 48, height: 48)
                    
                    Image(systemName: icon)
                        .font(.system(size: 22))
                        .foregroundColor(color)
                }
                
                Text(title)
                    .font(.title2.bold())
            }
            
            Text(description)
                .foregroundColor(.secondary)
        }
    }
}

struct CodeExample: View {
    let title: String
    let code: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            
            Text(code)
                .font(.system(.caption, design: .monospaced))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }
}

struct InfoNote: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "info.circle.fill")
                .foregroundColor(.blue)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.blue.opacity(0.08))
        .cornerRadius(10)
    }
}

#Preview {
    SettingsView()
}
