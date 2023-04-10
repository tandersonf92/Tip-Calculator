//
//  HeaderView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class HeaderView: UIView {
    
    // MARK: Properties
    private let topText: String
    private let bottomText: String
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 1
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var topSpacerView: UIView = UIView()
    
    private lazy var topLabel: UILabel = LabelFactory.build(text: topText,
                                                            font: ThemeFont.bold(ofSize: 18))
    
    private lazy var bottomLabel: UILabel = LabelFactory.build(text: bottomText,
                                                               font: ThemeFont.regular(ofSize: 16))
    
    private lazy var bottomSpacerView: UIView = UIView()
    
    // MARK: Life Cycle
    init(topText: String, bottomText: String) {
        self.topText = topText
        self.bottomText = bottomText
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: ViewConfiguration
extension HeaderView: ViewConfiguration {
    func configViews() { }
    
    func buildViews() {
        addSubview(contentStackView)
         [topLabel,
         bottomLabel,
         bottomSpacerView].forEach(contentStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        contentStackView.setAnchorsEqual(to: self)
        self.size(width: 70)
    }
}
