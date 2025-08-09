//
//  TicketBoxApp.swift
//  TicketBox
//
//  Created by Biniza Ruiz on 07/08/25.
//

import SwiftUI

@main
struct TicketBoxApp: App {
    
    @StateObject var viewModel = TicketViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
