import SwiftUI
import UIKit
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @ObservedObject var viewModel: TicketViewModel

    @Binding var isShown: Bool
    @Binding var images: [UIImage]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, images: $images, viewModel: self.viewModel)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        @Binding var isShown: Bool
        @Binding var images: [UIImage]
        
        @ObservedObject var viewModel: TicketViewModel
        
        init(isShown: Binding<Bool>, images: Binding<[UIImage]>, viewModel: TicketViewModel) {
            _isShown = isShown
            _images = images
            self.viewModel = viewModel
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            var selectedImages: [UIImage] = []
            
            let dispatchGroup = DispatchGroup()
            
            for result in results {
                dispatchGroup.enter()
                
                result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                    if let image = object as? UIImage {
                        selectedImages.append(image)
                    }
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                // Append the new images to the existing array.
                self.images.append(contentsOf: selectedImages)
                
                for image in selectedImages {
                    self.viewModel.add(image)
                }
                
                self.isShown = false
            }
        }
    }
}
