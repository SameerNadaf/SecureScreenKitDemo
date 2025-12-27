//
//  BankingDemoView.swift
//  SecureScreenKitDemo
//

import SwiftUI
import SecureScreenKit

struct BankingDemoView: View {
    let accounts = [
        ("Checking", "$12,450.00", "checkmark.circle.fill", Color.green),
        ("Savings", "$45,890.00", "banknote.fill", Color.blue),
        ("Investment", "$128,340.00", "chart.line.uptrend.xyaxis", Color.purple),
        ("Credit Card", "-$2,340.00", "creditcard.fill", Color.red)
    ]
    
    var body: some View {
        ScreenProtectedView(recordingPolicy: .block(reason: "Banking information is protected")) {
            ScrollView {
                VStack(spacing: 16) {
                    // Total Balance Card
                    VStack(spacing: 8) {
                        Text("Total Balance")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                        
                        Text("$184,340.00")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 32)
                    .background(
                        LinearGradient(
                            colors: [Color.orange, Color.pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(20)
                    
                    // Account Cards
                    ForEach(accounts, id: \.0) { account in
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(account.3.opacity(0.15))
                                    .frame(width: 48, height: 48)
                                
                                Image(systemName: account.2)
                                    .foregroundColor(account.3)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(account.0)
                                    .font(.headline)
                                Text("Available Balance")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Text(account.1)
                                .font(.headline)
                                .foregroundColor(account.3)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemBackground))
                        )
                    }
                }
                .padding()
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("Banking")
    }
}

#Preview {
    NavigationView {
        BankingDemoView()
    }
}
