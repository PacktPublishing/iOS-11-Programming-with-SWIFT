//
//  Entry.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/1/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

struct Entry: Codable {
    
    var title: String
    var body: String
    var tag: String
    var customColor: CustomColor
    var color: UIColor {
        switch customColor {
        case .darkGray: return .darkGray
        case .blue: return .blue
        case .red: return .red
        case .brown: return .brown
        case .orange: return .orange
        case .green: return .green
        case .purple: return .purple
        }
    }
    
    enum CustomColor: Int, Codable {
        case darkGray = 1
        case blue
        case red
        case brown
        case orange
        case green
        case purple
    }
    
    mutating func update(title: String? = nil,
                body: String? = nil,
                tag: String? = nil,
                customColor: CustomColor? = nil) {
        if let title = title {
            self.title = title
        }
        if let body = body {
            self.body = body
        }
        if let tag = tag {
            self.tag = tag
        }
        if let customColor = customColor {
            self.customColor = customColor
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
