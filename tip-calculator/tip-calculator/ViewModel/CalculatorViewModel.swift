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

        input.tipPublisher.sink { tip in
            print("the tip: \(tip)")
        }.store(in: &cancellables)

        let result = Result(amountPerPerson: 500,
                            totalBill: 1000,
                            totalTip: 50.0)
        
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
}