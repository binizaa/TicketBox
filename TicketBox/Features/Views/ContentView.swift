import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: TicketViewModel
    
    @StateObject var vm = CoreDataViewModel()
    
    @State private var isShowingImagePicker = false
    @State private var selectedImages: [UIImage] = []

    var body: some View {
        VStack {
            Text("Ingresa tu ticket")
            
            Button("Add ticket") {
                isShowingImagePicker = true
            }
            .padding()
            
            .padding()
            
            ScrollView() {
                tickets
            }
        }
        .padding()
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(viewModel: viewModel, isShown: $isShowingImagePicker, images: $selectedImages)
        }
    }
    
    var tickets: some View {
        
        VStack {
            ForEach(viewModel.tickets) { ticket in
                HStack {
                    Text(ticket.debugDescription)
                    if let image = ticket.imageData {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .padding(5)
                    } else {
                        Text("No se encontró imagen")
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: TicketViewModel())
}
