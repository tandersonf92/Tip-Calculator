//
//  LogoView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class LogoView: UIView {
    
    // MARK: Properties
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
//        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "icCalculatorBW")
        return imageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = -4
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Mr TIP",
            attributes: [.font: ThemeFont.demiBold(ofSize: 16)]
        )
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3))
        label.attributedText = text
        return label
    }()
    
    private lazy var bottomLabel: UILabel = LabelFactory.build(text: "Calculator",
                                                               font: ThemeFont.demiBold(ofSize: 20))
    
    
    
    
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
    }
    
    func buildViews() {
        addSubview(contentStackView)
        [imageView, labelsStackView].forEach(contentStackView.addArrangedSubview)
        [topLabel, bottomLabel].forEach(labelsStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        contentStackView.centerXEqualTo(self)
        contentStackView.anchors(topReference: self.topAnchor,
                                 bottomReference: self.bottomAnchor)
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
    }
}
