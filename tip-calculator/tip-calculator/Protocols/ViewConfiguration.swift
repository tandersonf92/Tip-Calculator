//
//  ViewConfiguration.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

protocol ViewConfiguration {
    func setupViews()
    func configViews()
    func buildViews()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViews() {
        configViews()
        buildViews()
        setupConstraints()
    }
}
