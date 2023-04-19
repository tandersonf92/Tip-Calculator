//
//  CalculatorViewModel.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 10/04/23.
//

import Foundation
import Combine


final class CalculatorViewModel {
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func transform(input: Input) -> Output {

        let updateViewPublisher = Publishers.CombineLatest3(
            input.billPublisher,
            input.tipPublisher,
            input.splitPublisher).flatMap { [unowned self] (bill, tip, split) in //-> (Publishers.FlatMap<Publisher, Publishers.CombineLatest3<AnyPublisher<Double, Never>, AnyPublisher<Tip, Never>, AnyPublisher<Int, Never>>>) // confirmar o type
            let totalTip = getTipAmout(bill: bill, tip: tip)
            let totalBill = bill + totalTip
            let amountPerPerson = totalBill / Double(split)
            
            let result = Result(amountPerPerson: amountPerPerson,
                                    totalBill: totalBill,
                                    totalTip: totalTip)
                
//            return Just(result)
            }.eraseToAnyPublisher()
        return Output(updateViewPublisher: updateViewPublisher)
    }
    
    private func getTipAmout(bill: Double, tip: Tip) -> Double {
        switch tip {
        case .none:
            return 0
        case .tenPercent:
            return bill * 0.1
        case .fifteenPercent:
            return bill * 0.15
        case .twentyPercent:
            return bill * 0.2
        case .custom(let value):
            return Double(value)
        }
    }
    
}
