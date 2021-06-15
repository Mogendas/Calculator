//
//  NSExpression+float.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-13.
//

import Foundation

extension NSExpression {
    var floatifiedForDivisionIfNeeded: NSExpression {
        if function == "divide:by:", let args = arguments, let last = args.last,
          let firstValue = args.first?.constantValue as? NSNumber {
            let newFirst = NSExpression(forConstantValue: firstValue.doubleValue)
            return NSExpression(forFunction: function, arguments: [newFirst, last])
        } else {
            return self
        }
    }
}
