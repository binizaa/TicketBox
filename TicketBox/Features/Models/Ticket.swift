// Ticket.swift
import Foundation
import UIKit

struct Ticket: Identifiable, Hashable {
    let id: UUID
    var date: Date
    var imageData: UIImage?
    
    init(
        id: UUID = UUID(),
        date: Date = Date(),
        imageData: UIImage? = nil,

    ) {
        self.id = id
        self.date = date
        self.imageData = imageData
    }
}
