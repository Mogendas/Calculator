//
//  BitcoinRateModel.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-15.
//

import Foundation

struct Rates: Codable {
    let asset_id_base: String
    let rates: [BitcoinRate]
}

struct BitcoinRate: Codable {
    let asset_id_quote: String
    let rate: Double
}
