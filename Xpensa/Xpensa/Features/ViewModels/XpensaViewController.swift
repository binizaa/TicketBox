//
//  AccountViewController.swift
//  Xpensa
//
//  Created by Biniza Ruiz on 03/09/25.
//

import Foundation

class XpensaViewModel: ObservableObject {
    @Published var accounts: [Account] = []
    
    init () {
        accounts = [
            Account(name: "TEC", balance: 47590.00, iconName: "building.columns.fill"),
            Account(name: "BLUE", balance: 1848.76, iconName: "building.columns.fill"),
            Account(name: "NU", balance: 24851.87, iconName: "creditcard.fill"),
            Account(name: "AGAGA", balance: 24851.87, iconName: "creditcard.fill")
        ]
    }
    
    func addAccount(name: String, value: Double, iconName: String) {
        let newCard = Account(name: name, balance: value, iconName: iconName)
        accounts.append(newCard)
    }
    
    func updateAccountValue(account: Account, newValue: Double){
        let index = accounts.firstIndex(where: {account.id == $0.id})
        
        if (index != nil) {
            accounts[index!].balance = newValue
        }
    }
}
