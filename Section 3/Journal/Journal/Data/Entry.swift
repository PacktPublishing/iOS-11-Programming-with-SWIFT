//
//  Entry.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/1/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

struct Entry {
    
    var title: String
    var body: String
    var tag: String
    var color: UIColor
    
    mutating func update(title: String? = nil,
                body: String? = nil,
                tag: String? = nil,
                color: UIColor? = nil) {
        if let title = title {
            self.title = title
        }
        if let body = body {
            self.body = body
        }
        if let tag = tag {
            self.tag = tag
        }
        if let color = color {
            self.color = color
        }
    }
    
}

extension Entry: Equatable {
    
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title
            && lhs.body == rhs.body
            && lhs.tag == rhs.tag
            && lhs.color == rhs.color
    }
    
}
