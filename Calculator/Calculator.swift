//
//  Calculator.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-13.
//

import Foundation

protocol Calculator {
    func calculate(equationString: String) -> Double?
}

final class DefaultCalculator: Calculator {
    func calculate(equationString: String) -> Double? {
        let exp = NSExpression(format: equationString)
        guard let result = exp.expressionValue(with: nil, context: nil) as? NSNumber else { return nil }
        return result.doubleValue
    }
    
}
