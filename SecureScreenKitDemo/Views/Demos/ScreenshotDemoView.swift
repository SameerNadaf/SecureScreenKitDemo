//
//  ScreenshotDemoView.swift
//  SecureScreenKitDemo
//

import SwiftUI
import SecureScreenKit

struct ScreenshotDemoView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Take a screenshot to test!")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ScreenshotProofView {
                VStack(spacing: 16) {
                    Image(systemName: "camera.metering.none")
                        .font(.system(size: 60))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text("Secret Content")
                        .font(.title.bold())
                    
                    Text("This text will be INVISIBLE\nin screenshots!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Text("PIN: 1234")
                        .font(.system(.title2, design: .monospaced))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(40)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color(.systemBackground))
                        .shadow(color: .blue.opacity(0.2), radius: 20, x: 0, y: 10)
                )
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Screenshot")
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview {
    NavigationView {
        ScreenshotDemoView()
    }
}
