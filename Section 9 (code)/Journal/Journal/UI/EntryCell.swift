//
//  EntryCell.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/11/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func updateCell(with entry: Entry) {
        colorView.backgroundColor = entry.color
        titleLabel.text = entry.title
        bodyLabel.text = entry.body
    }
    
}
