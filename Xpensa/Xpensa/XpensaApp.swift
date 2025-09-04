import SwiftUI

@main
struct XpensaApp: App {
    @StateObject private var viewModel = XpensaViewModel()
    
    var body: some Scene {
        WindowGroup {
            // Aquí se pasa el viewModel a la vista principal
            XpensaView(viewModel: viewModel)
        }
    }
}
