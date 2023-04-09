//
//  BillInputView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class BillInputView: UIView {
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: ViewConfiguration
extension BillInputView: ViewConfiguration {
    func configViews() {
        backgroundColor = .darkGray
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
}

