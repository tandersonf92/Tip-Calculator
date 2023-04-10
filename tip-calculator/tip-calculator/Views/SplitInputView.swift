//
//  SplitInputView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class SplitInputView: UIView {
    
    // MARK: Properties
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var headerView: HeaderView = HeaderView(topText: "Split", bottomText: "the total")
    
    private lazy var buttonsContentStackView: UIStackView = UIStackView()
    
    private lazy var decrementButton: UIButton = buildButton(
        text: "-",
        corners: [.layerMinXMaxYCorner,
                  .layerMinXMinYCorner]
    )
    
    private lazy var quantityLabel: UILabel = LabelFactory.build(
        text: "1",
        font: ThemeFont.bold(ofSize: 20),
        backgroundColor: .white,
        textAlignment: .center
    )
    
    private lazy var incrementButton: UIButton = buildButton(
        text: "+",
        corners: [.layerMaxXMinYCorner,
                  .layerMaxXMaxYCorner]
    )
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: Private functions
    private func buildButton(text: String, corners: CACornerMask) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.addRoundedCorners(corners: corners, radius: 8.0)
        button.backgroundColor = ThemeColor.primary
        return button
    }
}

// MARK: ViewConfiguration
extension SplitInputView: ViewConfiguration {
    func configViews() {
    }
    
    func buildViews() {
        addSubview(contentStackView)
        [headerView,
         buttonsContentStackView].forEach(contentStackView.addArrangedSubview)
        
        [decrementButton, quantityLabel, incrementButton].forEach(buttonsContentStackView.addArrangedSubview)
        
        [decrementButton, incrementButton].forEach { button in
            button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        }
    }
    
    func setupConstraints() {
        contentStackView.setAnchorsEqual(to: self)
    }
}
