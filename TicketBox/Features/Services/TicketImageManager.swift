// TicketImageManager.swift
import UIKit

final class TicketImageManager {
    private let fm = FileManager.default
    
    private var directoryURL: URL {
        // Documents/TicketImages
        let base = fm.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dir = base.appendingPathComponent("TicketImages", isDirectory: true)
        if !fm.fileExists(atPath: dir.path) {
            try? fm.createDirectory(at: dir, withIntermediateDirectories: true)
        }
        return dir
    }
    
    /// Guarda imagen como PNG. Retorna el nombre de archivo (para guardar en Core Data).
    @discardableResult
    func saveTicketImage(_ image: UIImage, _ suggestedName: String) -> String {
        let filename = "\(suggestedName).png"
        let url = directoryURL.appendingPathComponent(filename)
        guard let data = image.pngData() else { return "" }
        do {
            try data.write(to: url, options: .atomic)
            return filename
        } catch {
            print("❗️Error guardando imagen: \(error)")
            return ""
        }
    }
    
    func loadTicketImage(named filename: String) -> UIImage? {
        let url = directoryURL.appendingPathComponent(filename)
        guard fm.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
    
    func deleteTicketImage(named filename: String) {
        let url = directoryURL.appendingPathComponent(filename)
        try? fm.removeItem(at: url)
    }
}
