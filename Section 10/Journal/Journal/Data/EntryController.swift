//
//  EntryController.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/1/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

class EntryController {
    
    static let shared = EntryController()
    
    let entryStorage = EntryStorageController()
    
    var entries: [Entry] = []
    var tags: [String] {
        var tags = Set<String>()
        entries.forEach {
            tags.update(with: $0.tag.capitalized)
        }
        return Array(tags).sorted()
    }
    
    init() {
        entries = entryStorage.fetchEntries()
    }
    
    // CRUD
    
    func createEntry(withTitle title: String, body: String, tag: String? = nil, color: Entry.CustomColor) {
        let entry = Entry(title: title, body: body, tag: tag ?? "Untagged", customColor: color)
        entries.append(entry)
        save()
    }
    
    func getEntry(at indexPath: IndexPath) -> Entry {
        // IndexPath (x, y)
        let tag = tags[indexPath.section]
        let entries = getEntries(with: tag)
        return entries[indexPath.row]
    }
    
    func getEntries(with tag: String) -> [Entry] {
        return entries.filter { $0.tag.lowercased() == tag.lowercased() }.sorted { $0.title < $1.title }
    }
    
    func updateEntry(_ entry: Entry, with title: String, body: String, tag: String? = nil, color: Entry.CustomColor) {
        guard let index = entries.index(of: entry) else { return }
        entries[index].title = title
        entries[index].body = body
        entries[index].tag = tag ?? "Untagged"
        entries[index].customColor = color
        save()
    }
    
    func deleteEntry(_ entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        save()
    }
    
    func save() {
        entryStorage.save(entries)
    }
    
}
