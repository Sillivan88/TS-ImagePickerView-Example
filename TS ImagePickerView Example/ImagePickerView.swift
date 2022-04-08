//
//  ImagePickerView.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 08.04.22.
//

import PhotosUI
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var imagePickerConfiguration = PHPickerConfiguration()
        imagePickerConfiguration.filter = .images
        imagePickerConfiguration.selectionLimit = 1
        let imagePickerViewController = PHPickerViewController(configuration: imagePickerConfiguration)
        return imagePickerViewController
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
