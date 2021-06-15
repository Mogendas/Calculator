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
    
    func buttonPressed(button: CalculatorButton)
}

final class DefaultCalculatorViewModel: CalculatorViewModel {
    var calculationClosure: ((String) -> Void)?
    var state: CalculatorState = .basic
    var calculator: Calculator
    
    var calculations = [Calculation]()
    var currentCalculation = Calculation(calculationString: "", result: nil)
    
    init(calculator: Calculator) {
        self.calculator = calculator
    }
    
    func buttonPressed(button: CalculatorButton) {
        switch button.function {
        case "=":
            guard let calculation = calculator.calculate(calculation: currentCalculation) else { return }
            calculations.append(calculation)
            guard let result = calculation.result else { return }
            currentCalculation = Calculation(calculationString: "\(result)", result: nil)
            updateView()
        case "clear":
            calculations.removeAll()
            currentCalculation = Calculation(calculationString: "", result: nil)
            calculationClosure?("0")
        case "*", "/", "-", "+":
            currentCalculation.calculationString += " \(button.function) "
            updateView()
        case "cos":
            let lastNumber = currentCalculation.calculationString.lastElement()
            guard let numberAsDouble = Double(lastNumber) else { return }
            currentCalculation.calculationString = currentCalculation.calculationString.replacingOccurrences(of: lastNumber, with: String(cos(numberAsDouble)))
            updateView()
        case "sin":
            let lastNumber = currentCalculation.calculationString.lastElement()
            guard let numberAsDouble = Double(lastNumber) else { return }
            currentCalculation.calculationString = currentCalculation.calculationString.replacingOccurrences(of: lastNumber, with: String(sin(numberAsDouble)))
            updateView()
        default:
            currentCalculation.calculationString += "\(button.function)"
            updateView()
        }
    
    }
    
    private func updateView() {
        var text = ""
        for calculation in calculations {
            text += " \(calculation.calculationString)"
            text += " ="
        }
        text += " \(currentCalculation.calculationString)"
        guard let result = currentCalculation.result else {
            calculationClosure?(text)
            return
        }
        text += " \(result)"
        calculationClosure?(text)
    }
}

final class CalculatorButton: UIButton {
    @IBInspectable
    var function: String = "="
}
