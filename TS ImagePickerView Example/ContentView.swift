//
//  ContentView.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 08.04.22.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePickerView = false
    
    var body: some View {
        Button("Select photo") {
            showImagePickerView = true
        }
        .sheet(isPresented: $showImagePickerView) {
            ImagePickerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
