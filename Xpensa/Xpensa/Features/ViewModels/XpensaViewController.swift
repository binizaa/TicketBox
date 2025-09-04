//
//  AccountViewController.swift
//  Xpensa
//
//  Created by Biniza Ruiz on 03/09/25.
//

import Foundation

class AccountViewModel: ObservableObject {
    @Published var accounts: [Account] = []
    
    init () {
        accounts = [
            Account(name: "Tarjeta A", balance: 10),
            Account(name: "Tarjeta B", balance: 20),
            Account(name: "Tarjeta C", balance: 30)
        ]
    }
    
    func addAccount(name: String, value: Double) {
        let newCard = Account(name: name, balance: value)
        accounts.append(newCard)
    }
    
    func updateAccountValue(account: Account, newValue: Double){
        let index = accounts.firstIndex(where: {account.id == $0.id})
        
        if (index != nil) {
            accounts[index!].balance = newValue
        }
    }
}
