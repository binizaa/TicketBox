//
//  TicketViewModel.swift
//  TicketBox
//
//  Created by Biniza Ruiz on 07/08/25.
//

import Foundation
import UIKit
import Combine

class TicketViewModel: ObservableObject{
    
    @Published private var model = TicketApp()
        
    var tickets: [Ticket] {
        return model.tickets
    }
    
    // MARK: - Intents
    func add(_ image: UIImage) {
        model.addTicket(Date(),image)
        objectWillChange.send()
    }
}
 
