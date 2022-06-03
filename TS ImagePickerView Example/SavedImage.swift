//
//  SavedImage.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 03.06.22.
//

import CoreData

extension SavedImage {
    var data: Data? {
        guard let uuid = self.uuid else {
            return nil
        }
        let fileURL = ImageFileHandler.fileURL(for: uuid.uuidString)
        return try? Data(contentsOf: fileURL)
    }
}
