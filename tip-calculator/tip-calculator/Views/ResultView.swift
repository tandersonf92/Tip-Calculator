//
//  ResultView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class ResultView: UIView {
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: ViewConfiguration
extension ResultView: ViewConfiguration {
    func configViews() {
        backgroundColor = .blue
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
}

