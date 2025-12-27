//
//  PasswordDemoView.swift
//  SecureScreenKitDemo
//

import SwiftUI
import SecureScreenKit

struct PasswordDemoView: View {
    @State private var revealedIndex: Int? = nil
    
    let passwords = [
        ("Google", "john@gmail.com", "G••••••k#2024"),
        ("Apple", "john@icloud.com", "A••••••e$2024"),
        ("Netflix", "john@gmail.com", "N••••••x@2024"),
        ("Amazon", "john@gmail.com", "A••••••n%2024")
    ]
    
    var body: some View {
        List {
            ForEach(Array(passwords.enumerated()), id: \.offset) { index, item in
                ScreenshotProofView {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.0)
                                .font(.headline)
                            Text(item.1)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Text(revealedIndex == index ? item.2 : "••••••••")
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.red)
                        
                        Button {
                            withAnimation {
                                revealedIndex = revealedIndex == index ? nil : index
                            }
                        } label: {
                            Image(systemName: revealedIndex == index ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle("Passwords")
    }
}

#Preview {
    NavigationView {
        PasswordDemoView()
    }
}
