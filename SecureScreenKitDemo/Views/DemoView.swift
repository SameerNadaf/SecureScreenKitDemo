//
//  DemoView.swift
//  SecureScreenKitDemo
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        ScreenshotDemoView()
                    } label: {
                        DemoRow(
                            icon: "camera.fill",
                            title: "Screenshot Protection",
                            subtitle: "Content invisible in screenshots",
                            color: .blue
                        )
                    }
                    
                    NavigationLink {
                        RecordingDemoView()
                    } label: {
                        DemoRow(
                            icon: "video.fill",
                            title: "Recording Protection",
                            subtitle: "Overlay during screen recording",
                            color: .green
                        )
                    }
                    
                    NavigationLink {
                        CompleteDemoView()
                    } label: {
                        DemoRow(
                            icon: "lock.shield.fill",
                            title: "Complete Protection",
                            subtitle: "Both screenshot & recording",
                            color: .purple
                        )
                    }
                } header: {
                    Text("Protection Types")
                }
                
                Section {
                    NavigationLink {
                        BankingDemoView()
                    } label: {
                        DemoRow(
                            icon: "creditcard.fill",
                            title: "Banking App",
                            subtitle: "Real-world example",
                            color: .orange
                        )
                    }
                    
                    NavigationLink {
                        PasswordDemoView()
                    } label: {
                        DemoRow(
                            icon: "key.fill",
                            title: "Password Manager",
                            subtitle: "Secure credentials",
                            color: .red
                        )
                    }
                } header: {
                    Text("Real World Examples")
                }
            }
            .navigationTitle("Demos")
        }
    }
}

// MARK: - Demo Row

struct DemoRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.15))
                    .frame(width: 44, height: 44)
                
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(color)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    DemoView()
}
