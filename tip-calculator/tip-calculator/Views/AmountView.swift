//
//  AmountView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class AmountView: UIView {
    
    private let title: String
    private let textAlignment: NSTextAlignment
    
    
    // MARK: Properties
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = LabelFactory.build(text: "Total bill",
                                                              font: ThemeFont.regular(ofSize: 18),
                                                              textColor: ThemeColor.text, textAlignment: textAlignment)
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = ThemeColor.primary
        label.numberOfLines = 0
        label.textAlignment = textAlignment
        let text = NSMutableAttributedString(string: "$0",
                                             attributes: [.font: ThemeFont.bold(ofSize: 24)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 16)],
                           range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    
    
    // MARK: Life Cycle
    init(title: String, textAlignment: NSTextAlignment) {
        self.title = title
        self.textAlignment = textAlignment
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: ViewConfiguration
extension AmountView: ViewConfiguration {
    func configViews() {
//        backgroundColor = .red
    }
    
    func buildViews() {
        addSubview(contentStackView)
        [titleLabel, amountLabel].forEach(contentStackView.addArrangedSubview)
        
    }
    
    func setupConstraints() {
        contentStackView.setAnchorsEqual(to: self)
    }
}

