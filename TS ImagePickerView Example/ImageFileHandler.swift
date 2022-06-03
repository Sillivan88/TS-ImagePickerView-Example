//
//  ImageFileHandler.swift
//  TS ImagePickerView Example
//
//  Created by Thomas Sillmann on 03.06.22.
//

import Foundation

struct ImageFileHandler {
    static func fileURL(for fileName: String) -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentDirectory.appendingPathComponent("\(fileName).jpg")
    }
}
