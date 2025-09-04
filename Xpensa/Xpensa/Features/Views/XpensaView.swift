// XpensaView.swift
// Xpensa
//
// Created by Biniza Ruiz on 03/09/25.
//

import SwiftUI

// This extension helps in styling the add account button
extension Color {
    static let customTeal = Color(red: 0.13, green: 0.82, blue: 0.54)
}

struct XpensaView: View {
    @ObservedObject var viewModel: XpensaViewModel

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        Spacer()
                        Image(systemName: "bell.fill")
                            .font(.system(size: 24))
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 24))
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 10)

                    // Account grid
                    accountsView
                }
                .padding(.horizontal)
            }
        }
    }
    
    var accountsView: some View {
        // Define 2 filas para la cuadrícula
        let rows = [
            GridItem(.fixed(160)),  // Altura de cada celda
            GridItem(.fixed(160))
        ]
        
        return ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(viewModel.accounts) { account in
                    AccountView(account: account)
                        .frame(width: 160, height: 160) // Tamaño uniforme
                }

                // Botón para agregar cuenta
                Button(action: {
                    viewModel.addAccount(name: "Hola", value: 455, iconName: "plus.circle.fill")
                }) {
                    VStack(spacing: 8) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.customTeal)
                        Text("Add account")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .frame(width: 160, height: 160)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    .padding(.horizontal, 5)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.vertical)
            .padding(.horizontal, 10)
        }
    }

}

#Preview {
    XpensaView(viewModel: XpensaViewModel())
}
