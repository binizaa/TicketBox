import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isShown: Bool
    var onPicked: ([UIImage]) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(isShown: $isShown, onPicked: onPicked)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0            // 0 = ilimitado
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }

    final class Coordinator: NSObject, PHPickerViewControllerDelegate {
        @Binding var isShown: Bool
        let onPicked: ([UIImage]) -> Void

        init(isShown: Binding<Bool>, onPicked: @escaping ([UIImage]) -> Void) {
            _isShown = isShown
            self.onPicked = onPicked
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            guard !results.isEmpty else { isShown = false; return }

            let group = DispatchGroup()
            var images: [UIImage] = []
            images.reserveCapacity(results.count)

            for result in results {
                group.enter()
                // Para iOS 14+: loadObject; en iOS 16+ puedes usar loadTransferable(UIImage.self)
                result.itemProvider.loadObject(ofClass: UIImage.self) { object, _ in
                    if let img = object as? UIImage {
                        images.append(img)
                    }
                    group.leave()
                }
            }

            group.notify(queue: .main) {
                self.onPicked(images)
                self.isShown = false
            }
        }
    }
}
