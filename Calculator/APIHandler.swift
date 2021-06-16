//
//  APIHandler.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-15.
//

import Foundation

typealias BitcoinCompletion = ((Result<Double, Error>) -> Void)

final class APIHandler {
    let apiKey = "85A02963-28E4-43D0-86E2-B9A6E95349FF"
    let baseURL = "https://rest-sandbox.coinapi.io/v1/"
    let url = "exchangerate/BTC?apikey="
    
    
    func getBitcoinPrice(completion: @escaping BitcoinCompletion) {
        guard let url = URL(string: "\(baseURL)\(url)\(apiKey)") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let data = data,
                      let stuff = try? JSONDecoder().decode(Rates.self, from: data),
                      let rate = stuff.rates.first(where: { $0.asset_id_quote == "USD" })?.rate
                else { return }
                completion(.success(rate))
            }
        }.resume()
    }
    
}
