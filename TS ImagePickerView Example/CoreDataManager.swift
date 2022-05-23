//
//  CoreDataManager.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 13.05.22.
//

import CoreData
import Foundation

@MainActor
struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init() {
        container = NSPersistentContainer(name: "ImagePickerDataModel")
        container.loadPersistentStores(completionHandler: { (_, _) in })
    }
    
    func saveContext() {
        try? viewContext.save()
    }
}

extension CoreDataManager {
    @discardableResult func createSavedImage(with data: Data) -> SavedImage {
        let savedImage = SavedImage(context: viewContext)
        savedImage.data = data
        savedImage.creationDate = Date()
        saveContext()
        return savedImage
    }
}
