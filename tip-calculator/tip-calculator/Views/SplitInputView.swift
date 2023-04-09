//
//  SplitInputView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class SplitInputView: UIView {
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: ViewConfiguration
extension SplitInputView: ViewConfiguration {
    func configViews() {
        backgroundColor = .green
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
}

