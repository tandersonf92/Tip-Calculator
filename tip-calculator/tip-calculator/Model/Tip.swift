//
//  Tip.swift
//  tip-calculator
//
//  Created by Anderson Oliveira on 09/04/23.
//

enum Tip {
    case none
    case tenPercent
    case fifteenPercent
    case twentyPercent
    case custom(value: Int)
    
    var stringValuew: String {
        switch self {
        case .none:
            return ""
        case .tenPercent:
            return "10%"
        case .fifteenPercent:
            return "15%"
        case .twentyPercent:
            return "20%"
        case .custom(let value):
            return String(value)
        }
    }
}
