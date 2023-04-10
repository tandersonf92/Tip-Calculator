//
//  BillInputView.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class BillInputView: UIView {
    
    // MARK: Properties
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var headerView: HeaderView = HeaderView(topText: "Enter", bottomText: "your bill")
    
    private lazy var textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(radius: 8.0)
        return view
    }()
    
    
    private lazy var textFieldInternalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var currencyDenominationLabel: UILabel = {
        let label = LabelFactory.build(text: "$",
                                       font: ThemeFont.bold(ofSize: 24))
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = ThemeFont.demiBold(ofSize: 28)
        textField.keyboardType = .decimalPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.tintColor = ThemeColor.text
        textField.textColor = ThemeColor.text
        // Add toolbar
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: frame.size.width,
                                              height: 36))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil),
            doneButton
        ]
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
        return textField
    }()
    
    // MARK: Life Cycle
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: Selectors
    @objc private func doneButtonTapped() {
        textField.endEditing(true)
    }
}

// MARK: ViewConfiguration
extension BillInputView: ViewConfiguration {
    func configViews() { }
    
    func buildViews() {
        addSubview(contentStackView)
        [headerView,textFieldContainerView].forEach(contentStackView.addArrangedSubview)
        
        textFieldContainerView.addSubview(textFieldInternalStackView)
        [currencyDenominationLabel, textField].forEach(textFieldInternalStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        contentStackView.setAnchorsEqual(to: self)
        textFieldInternalStackView.setAnchorsEqual(to: textFieldContainerView, padding: .init(top: 4,
                                                                                              left: 8,
                                                                                              bottom: 4,
                                                                                              right: 8))
    }
}
