//
//  ColorView.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/1/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

class ColorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createView()
    }
    
    func createView() {
        let radius = max(frame.width, frame.height) / 2
        layer.cornerRadius = radius
        clipsToBounds = true
        backgroundColor = .lightGray
    }
    
}
