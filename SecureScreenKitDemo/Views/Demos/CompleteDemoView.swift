//
//  CompleteDemoView.swift
//  SecureScreenKitDemo
//

import SwiftUI
import SecureScreenKit

struct CompleteDemoView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Protected from BOTH!")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ScreenProtectedView(recordingPolicy: .block(reason: "Content is protected")) {
                VStack(spacing: 16) {
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text("Complete Protection")
                        .font(.title.bold())
                    
                    Text("Invisible in screenshots AND\nblocked during recording!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Text("SSN: XXX-XX-1234")
                        .font(.system(.title2, design: .monospaced))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(40)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color(.systemBackground))
                        .shadow(color: .purple.opacity(0.2), radius: 20, x: 0, y: 10)
                )
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Complete")
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview {
    NavigationView {
        CompleteDemoView()
    }
}
