//
//  AccountCard.swift
//  Xpensa
//
//  Created by Biniza Ruiz on 03/09/25.
//

import SwiftUI

// A placeholder for the individual account views
struct AccountView: View {
    var account: Account
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: account.iconName)
                .font(.system(size: 30))
                .foregroundColor(Color.red)
            Text(account.name)
                .font(.headline)
            Text("\(account.balance, specifier: "%.2f") MXN")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(height: 120)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
        .padding([.leading, .trailing], 5)
    }
}
