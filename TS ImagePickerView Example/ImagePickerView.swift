//
//  ImagePickerView.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 08.04.22.
//

import PhotosUI
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var showsImagePickerView: Bool
    
    var action: (Data?) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var imagePickerConfiguration = PHPickerConfiguration()
        imagePickerConfiguration.filter = .images
        imagePickerConfiguration.preferredAssetRepresentationMode = .current
        imagePickerConfiguration.selectionLimit = 1
        let imagePickerViewController = PHPickerViewController(configuration: imagePickerConfiguration)
        imagePickerViewController.delegate = context.coordinator
        return imagePickerViewController
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePickerView
        
        init(_ imagePickerView: ImagePickerView) {
            parent = imagePickerView
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let result = results.first {
                result.itemProvider.loadDataRepresentation(forTypeIdentifier: "public.image") { object, error in
                    self.parent.action(object)
                }
            }
            self.dismissImagePickerViewController()
        }
        
        private func dismissImagePickerViewController() {
            Task {
                await MainActor.run {
                    parent.showsImagePickerView = false
                }
            }
        }
    }
}


struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(showsImagePickerView: .constant(true)) { _ in }
    }
}
