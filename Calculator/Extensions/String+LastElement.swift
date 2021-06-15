//
//  String+LastElement.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-14.
//

import Foundation

extension String {
    func lastElement() -> String {
        let size = self.reversed().firstIndex(of: " ") ?? self.count
        let lastElement = self.index(self.endIndex, offsetBy: -size)
        return String(self[lastElement...])
    }
}
