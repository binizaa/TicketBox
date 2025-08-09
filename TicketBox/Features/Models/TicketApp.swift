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
            date: date,
            imageData: imageData
        )
        
        tickets.append(newTicket)
        
        print("Se agrego")
        
        //let imageManager = TicketImageManager()
        
        //let url = imageManager.saveTicketImage(imageData, "ticket_12345")
        
        //print(url as Any)
    }
    
    struct Ticket : Identifiable, CustomDebugStringConvertible {
        
        var debugDescription: String {
            return """
            Ticket ID: \(id)
            Fecha: \(date.formatted())
            Imagen: \(imageData != nil ? "Sí" : "No")
            """
        }
        
        var id = UUID()
        var date: Date
        //var amount: Double
        //var category: String
        //var description: String
        var imageData: UIImage?

    }
}
