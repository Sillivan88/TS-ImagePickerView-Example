//
//  ContentView.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 08.04.22.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(
        entity: SavedImage.entity(),
        sortDescriptors: [NSSortDescriptor(key: "creationDate", ascending: true)]
    )
    private var savedImages: FetchedResults<SavedImage>
    
    @State private var showImagePickerView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 200))]) {
                    ForEach(savedImages) { savedImage in
                        if let savedImageData = savedImage.data, let uiImage = UIImage(data: savedImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Images")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Select photo") {
                        showImagePickerView = true
                    }
                }
            }
        }
        .sheet(isPresented: $showImagePickerView) {
            ImagePickerView(showsImagePickerView: $showImagePickerView) { imageData in
                if let data = imageData {
                    CoreDataManager.shared.createSavedImage(with: data)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
