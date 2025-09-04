//
//  Account.swift
//  Xpensa
//
//  Created by Biniza Ruiz on 03/09/25.
//

import Foundation

struct Account: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var balance: Double
    let iconName: String
}
