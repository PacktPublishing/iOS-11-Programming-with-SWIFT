//
//  EntryStorageController.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/14/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import Foundation

class EntryStorageController {
    
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    func save(_ entries: [Entry]) {
        guard let url = directoryURL?.appendingPathComponent("entries.json", isDirectory: false) else { fatalError() }
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchEntries() -> [Entry] {
        guard let url = directoryURL?.appendingPathComponent("entries.json", isDirectory: false) else { fatalError() }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            return []
        }
        
        if let data = FileManager.default.contents(atPath: url.path) {
            let decoder = JSONDecoder()
            do {
                let entries = try decoder.decode([Entry].self, from: data)
                return entries
            } catch {
                return []
            }
        } else {
            fatalError("No data at \(url.path).")
        }
    }
    
}








