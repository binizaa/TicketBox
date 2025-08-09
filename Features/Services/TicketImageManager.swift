//
//  TicketImageManager.swift
//  TicketBox
//
//  Created by Biniza Ruiz on 08/08/25.
//
import Foundation
import UIKit

class TicketImageManager {
    let fileManager = FileManager.default

    var documentsDirectory: URL {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Dont found")
        }
        
        return url
    }
    
    var ticketImagesDirectory: URL {
        return documentsDirectory.appendingPathExtension("TicketImages")
    }
    
    init() {
        createTicketImagesDirectory()
    }
    
    private func createTicketImagesDirectory() {
        do {
            try fileManager.createDirectory(at: ticketImagesDirectory, withIntermediateDirectories: true, attributes: nil)
            print("Ticket manager: \(ticketImagesDirectory.path)")
        } catch {
            print("Error tickets manager: \(error.localizedDescription)")
        }
    }
    
    func saveTicketImage(_ image: UIImage,_ name: String) -> URL? {
        let fileName = "\(name).png"
        let fileURL = ticketImagesDirectory.appendingPathComponent(fileName)
        
        guard let imageData = image.pngData() else {
            print("Error: Could not convert image to PNG Data.")
            return nil
        }
        
        do {
            try imageData.write(to: fileURL)
            print("Ticket image successfully saved to: \(fileURL.path)")
            return fileURL
        } catch {
            print("Error saving ticket image: \(error.localizedDescription)")
            return nil
        }
    }
    
    func loadTicketImage(_ fileName: String) -> UIImage? {
        let fileURL = ticketImagesDirectory.appendingPathComponent(fileName)
        
        do {
            let imageData = try Data(contentsOf: fileURL)
            
            if let image = UIImage(data: imageData) {
                print("Ticket image successfully uploaded \(fileName)")
                return image
            }else {
                print("Error: Could not create UIImage from data")
                return nil
            }
        }catch {
            print("Error loading ticket image \(fileName)")
            return nil
        }
    }
    
}
