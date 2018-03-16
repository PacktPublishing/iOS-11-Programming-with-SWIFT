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
    
    var entries: [Entry] = []
    var tags: [String] {
        var tags = Set<String>()
        entries.forEach {
            tags.update(with: $0.tag.capitalized)
        }
        return Array(tags).sorted()
    }
    
    init() {
        let entry1 = Entry(title: "My first Entry", body: "This is my first entry", tag: "Journal", customColor: .darkGray)
        let entry2 = Entry(title: "Another Entry", body: "Here is another entry for my Journal. This entry will have some additional text to be able to demonstrate setting dynamic tableview cell heights using the tableviewdelegate methods.", tag: "Journal", customColor: .darkGray)
        let entry3 = Entry(title: "Yet another Entry", body: "The body for another entry in my journal", tag: "Journal", customColor: .darkGray)
        let entry4 = Entry(title: "One more Entry", body: "This is the last entry for my journal for today", tag: "journal", customColor: .darkGray)
        entries = [entry1, entry2, entry3, entry4]
    }
    
    // CRUD
    
    func createEntry(withTitle title: String, body: String, tag: String? = nil, color: Entry.CustomColor) {
        let entry = Entry(title: title, body: body, tag: tag ?? "Untagged", customColor: color)
        entries.append(entry)
        // Save
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
        // Save
    }
    
    func deleteEntry(_ entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        // Save
    }
    
}
