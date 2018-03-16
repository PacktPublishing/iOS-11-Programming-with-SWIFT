//
//  ColorView.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/1/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

protocol ColorViewDelegate: class {
    func selectColor(customColor: Entry.CustomColor)
}

class ColorView: UIView {
    
    var isSelected = false
    var isSelectedView = UIView(frame: CGRect.zero)
    
    var delegate: ColorViewDelegate?
    
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
        backgroundColor = setupBackground()
        
        isSelectedView.frame = CGRect(x: 10.0, y: 10.0, width: frame.width - 20.0, height: frame.height - 20.0)
        let selectedRadius = max(isSelectedView.frame.width, isSelectedView.frame.height) / 2.0
        isSelectedView.layer.cornerRadius = selectedRadius
        isSelectedView.clipsToBounds = true
        isSelectedView.backgroundColor = .black
        isSelectedView.alpha = isSelected ? 0.5 : 0.0
        
        addSubview(isSelectedView)
        
        setupTap()
    }
    
    func setupBackground() -> UIColor {
        switch tag {
        case 1: return .darkGray
        case 2: return .blue
        case 3: return .red
        case 4: return .brown
        case 5: return .orange
        case 6: return .green
        case 7: return .purple
        default: return .darkGray
        }
    }
    
    func getColor() -> Entry.CustomColor {
        switch tag {
        case 1: return .darkGray
        case 2: return .blue
        case 3: return .red
        case 4: return .brown
        case 5: return .orange
        case 6: return .green
        case 7: return .purple
        default: return .darkGray
        }
    }
    
    func toggle() {
        isSelected = !isSelected
        isSelectedView.alpha = isSelected ? 0.5 : 0.0
    }
    
    func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectColor))
        addGestureRecognizer(tap)
    }
    
    @objc func selectColor() {
        delegate?.selectColor(customColor: getColor())
        toggle()
    }
    
}
