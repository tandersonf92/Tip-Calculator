//
//  ViewController.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 36
        return stackView
    }()
    
    private lazy var logoView: LogoView = LogoView()
    private lazy var resultView: ResultView = ResultView()
    private lazy var billInputView: BillInputView = BillInputView()
    private lazy var tipInputView: TipInputView = TipInputView()
    private lazy var splitInputView: SplitInputView = SplitInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        setupViews()
    }
}

extension CalculatorViewController: ViewConfiguration {
    func configViews() {
        view.backgroundColor = ThemeColor.bg
    }
    
    func buildViews() {
        view.addSubview(contentStackView)
        [logoView,
         resultView,
         billInputView,
         tipInputView,
         splitInputView,
         UIView()].forEach(contentStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.setAnchorsEqual(to: view,
                                         isSafeArea: true,
                                         padding: .init(top: 24,
                                                        left: 24,
                                                        bottom: 24,
                                                        right: 24))
        
        resultView.size(height: 224)
        billInputView.size(height: 56)
        tipInputView.size(height: 130)
        splitInputView.size(height: 56)
    }
}
