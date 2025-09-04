// XpensaView.swift
// Xpensa
//
// Created by Biniza Ruiz on 03/09/25.
//

import SwiftUI

struct XpensaView: View {
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.accounts) { account in
                    VStack(alignment: .leading) {
                        Text(account.name)
                            .font(.headline)
                        Text("Balance: \(account.balance, specifier: "%.2f")")
                            .font(.subheadline)
                    }
                    .padding()
                    .contextMenu {
                        Button("Incrementar balance") {
                            viewModel.updateAccountValue(account: account, newValue: account.balance + 10)
                        }
                        Button("Decrementar balance") {
                            viewModel.updateAccountValue(account: account, newValue: account.balance - 10)
                        }
                    }
                }
            }
            .navigationTitle("Mis Cuentas")
        }
    }
}
