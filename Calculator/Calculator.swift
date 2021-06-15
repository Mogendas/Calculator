//
//  Calculator.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-13.
//

import Foundation

protocol Calculator {
    func calculate(calculation: Calculation) -> Calculation?
}

final class DefaultCalculator: Calculator {
    func calculate(calculation: Calculation) -> Calculation? {
        let exp = NSExpression(format: calculation.calculationString).floatifiedForDivisionIfNeeded
        guard let result = exp.expressionValue(with: nil, context: nil) as? NSNumber else { return nil }
        return Calculation(calculationString: calculation.calculationString, result: result.doubleValue)
    }
    
}
