//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-12.
//

import UIKit

typealias CalculationClosure = ((String) -> Void)?

protocol CalculatorViewModel {
    var calculationClosure: CalculationClosure { get set }
    var state: CalculatorState { get set }
    var calculator: Calculator { get set }
    
    func buttonPressed(button: UIButton)
}

final class DefaultCalculatorViewModel: CalculatorViewModel {
    var calculationClosure: ((String) -> Void)?
    var state: CalculatorState = .basic
    var calculator: Calculator
    
    init(calculator: Calculator) {
        self.calculator = calculator
    }
    
    func buttonPressed(button: UIButton) {
        
    }
}
