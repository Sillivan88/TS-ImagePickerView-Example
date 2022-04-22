//
//  ContentView.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 08.04.22.
//

import SwiftUI

struct ContentView: View {
    @State private var photoData: Data?
    
    @State private var showImagePickerView = false
    
    var body: some View {
        VStack {
            if let photoData = self.photoData, let uiImage = UIImage(data: photoData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            Button("Select photo") {
                showImagePickerView = true
            }
        }
        .sheet(isPresented: $showImagePickerView) {
            ImagePickerView(showsImagePickerView: $showImagePickerView) { imageData in
                photoData = imageData
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
