//
//  LogoView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class LogoView: UIView {
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: ViewConfiguration
extension LogoView: ViewConfiguration {
    func configViews() {
        backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
}
