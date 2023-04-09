//
//  TipInputView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class TipInputView: UIView {
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: ViewConfiguration
extension TipInputView: ViewConfiguration {
    func configViews() {
        backgroundColor = .yellow
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
}

