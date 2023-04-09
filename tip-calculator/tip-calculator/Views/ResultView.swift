//
//  ResultView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class ResultView: UIView {
    
    // MARK: Properties
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var headerLabel: UILabel = LabelFactory.build(text: "Total p/person",
                                                               font: ThemeFont.demiBold(ofSize: 18),
                                                               textAlignment: .center)
    
    private lazy var amountPerPersonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        let text = NSMutableAttributedString(string: "$0",
                                             attributes: [.font: ThemeFont.bold(ofSize: 48)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)],
                           range: NSMakeRange(0, 1))
        label.numberOfLines = 0
        label.attributedText = text
        return label
    }()
    
    private lazy var horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var horizontalAmoutComponentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var amountView1: AmountView = AmountView(title: "Total bill", textAlignment: .left)
    
    private lazy var spacerView: UIView = UIView()
    
    private lazy var amountView2: AmountView = AmountView(title: "Total tip", textAlignment: .right)
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: Private functions
    private func buildSpacerView(height: CGFloat) -> UIView {
        let view = UIView()
        view.size(height: height)
        return view
    }
}

// MARK: ViewConfiguration
extension ResultView: ViewConfiguration {
    func configViews() {
        backgroundColor = .white
        self.addShadow(offset: CGSize(width: 0, height: 3),
                       color: .black,
                       radius: 12,
                       opacity: 0.1)
    }
    
    func buildViews() {
        addSubview(contentStackView)
        [headerLabel,
         amountPerPersonLabel,
         horizontalLineView,
         buildSpacerView(height: 0),
         horizontalAmoutComponentsStackView,
         UIView()].forEach(contentStackView.addArrangedSubview)
        [amountView1, spacerView, amountView2].forEach(horizontalAmoutComponentsStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        contentStackView.setAnchorsEqual(to: self, padding: .init(top: 24,
                                                                  left: 24,
                                                                  bottom: 24,
                                                                  right: 24))
        horizontalLineView.size(height: 2)
    }
}
