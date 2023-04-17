//
//  UIResponder+Extensions.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 17/04/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        next as? UIViewController ?? next?.parentViewController
    }
}
