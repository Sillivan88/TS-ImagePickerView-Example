//
//  TS_ImagePickerView_ExampleApp.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 08.04.22.
//

import SwiftUI

@main
struct TS_ImagePickerView_ExampleApp: App {
    private let coreDataManager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.viewContext)
        }
    }
}
