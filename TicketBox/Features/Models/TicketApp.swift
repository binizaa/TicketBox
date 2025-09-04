//
//  TicketApp.swift
//  TicketBox
//
//  Created by Biniza Ruiz on 07/08/25.
//

import Foundation
import UIKit

struct TicketApp {
    
    private(set) var tickets: Array<Ticket>
    
    init(){
        self.tickets = []
    }
    
    mutating func addTicket( _ date : Date, _ imageData : UIImage) {
        let newTicket = Ticket(
            id: UUID(),
            date: date,
            imageData: imageData
        )
        
        tickets.append(newTicket)
        
        print("Se agrego")
        
        let coreData = CoreDataViewModel()
        
        coreData.addTicket(newTicket)
        
        //let imageManager = TicketImageManager()
        
        //let url = imageManager.saveTicketImage(imageData, "ticket_12345")
        
        //print(url as Any)
    }
}
