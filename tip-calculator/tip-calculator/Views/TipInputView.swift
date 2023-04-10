//
//  TipInputView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class TipInputView: UIView {
    
    // MARK: Properties
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var headerViewContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var headerView: HeaderView = HeaderView(topText: "Choose",
                                                         bottomText: "your tip")
    
    private lazy var tipButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var defaultValuestipButtonsContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var tenPercentTipButton: UIButton = buildTipButton(tip: .tenPercent)
    
    private lazy var fifteenPercentTipButton: UIButton = buildTipButton(tip: .fifteenPercent)
    
    private lazy var twentyPercentTipButton: UIButton = buildTipButton(tip: .twentyPercente)
    
    private lazy var customTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom tip", for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.backgroundColor = ThemeColor.primary
        button.addCornerRadius(radius: 8.0)
        return button
    }()
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: Private functions
    private func buildTipButton(tip: Tip) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = ThemeColor.primary
        button.addCornerRadius(radius: 8.0)
        let text = NSMutableAttributedString(
            string: tip.stringValuew,
            attributes: [.font: ThemeFont.demiBold(ofSize: 20),
                         .foregroundColor: UIColor.white]
        )
        text.addAttributes([.font: ThemeFont.demiBold(ofSize: 14)],
                           range: NSMakeRange(2, 1))
        button.setAttributedTitle(text, for: .normal)
        return button
    }
}

// MARK: ViewConfiguration
extension TipInputView: ViewConfiguration {
    func configViews() { }
    
    func buildViews() {
        addSubview(contentStackView)
        [headerView,
         tipButtonsStackView].forEach(contentStackView.addArrangedSubview)
        
        [defaultValuestipButtonsContainerStackView,
         customTipButton].forEach(tipButtonsStackView.addArrangedSubview)
        
        [tenPercentTipButton,
         fifteenPercentTipButton,
         twentyPercentTipButton].forEach(defaultValuestipButtonsContainerStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        contentStackView.setAnchorsEqual(to: self)
    }
}
