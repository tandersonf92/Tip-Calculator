//
//  LabelFactory.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

enum LabelFactory {
    
    static func build(text: String?,
                      font: UIFont,
                      backgroundColor: UIColor = .clear,
                      textColor: UIColor = ThemeColor.text,
                      textAlignment: NSTextAlignment = .left) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = backgroundColor
        label.textColor = textColor
        label.textAlignment = textAlignment
        
        return label
    }
}
