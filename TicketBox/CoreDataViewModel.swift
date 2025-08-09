//
//  CoreDataViewModel.swift
//  TicketBox
//
//  Created by Biniza Ruiz on 09/08/25.
//
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var savedEntities: [TicketEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "TicketsContainer")
        container.loadPersistentStores {(description, error) in
            if let error = error {
                print("error:  \(error)")
            }
        }
        
        fetchTickets()
    }
    
    func fetchTickets() {
        let request = NSFetchRequest<TicketEntity>(entityName: "TicketEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    func addTicket(text: String) {
        let newTicket = TicketEntity(context: container.viewContext)
        newTicket.date = Date()
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchTickets()
        }catch let error {
            print("Error saving. \(error)")
        }
    }
}
