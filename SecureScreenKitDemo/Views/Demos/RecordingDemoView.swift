//
//  RecordingDemoView.swift
//  SecureScreenKitDemo
//

import SwiftUI
import SecureScreenKit

struct RecordingDemoView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Start screen recording to test!")
                .font(.headline)
                .foregroundColor(.secondary)
            
            RecordingOverlayContainer(policy: .obscure(style: .blur(radius: 25))) {
                VStack(spacing: 16) {
                    Image(systemName: "video.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.green, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text("Recording Protected")
                        .font(.title.bold())
                    
                    Text("This shows a blur overlay\nduring screen recording!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Text("Balance: $50,000")
                        .font(.system(.title2, design: .monospaced))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(40)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color(.systemBackground))
                        .shadow(color: .green.opacity(0.2), radius: 20, x: 0, y: 10)
                )
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Recording")
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview {
    NavigationView {
        RecordingDemoView()
    }
}
