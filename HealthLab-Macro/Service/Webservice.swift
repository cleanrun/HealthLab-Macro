//
//  Webservice.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 04/04/22.
//

import Foundation

class Webservice {
    
    private static let API_KEY = ""
    
    enum Endpoint {
        case Search(query: String)
        case NutritionDetail(id: Int)
        
        var value: String {
            switch self {
            case .Search(let query):
                return "https://api.spoonacular.com/recipes/complexSearch?query=\(query)&apiKey=\(Webservice.API_KEY)"
            case .NutritionDetail(let id):
                return "https://api.spoonacular.com/recipes/\(id)/nutritionWidget.json?apiKey=\(Webservice.API_KEY)"
            }
        }
    }
    
    static func request<T: Decodable>(endpoint: Endpoint, type: T.Type, onSuccess: @escaping (T) -> Void, onFailed: @escaping (Error) -> Void) async {
        guard let url = URL(string: endpoint.value) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                onFailed(error!)
                return
            }
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let decodedData = try decoder.decode(type.self, from: data)
                    onSuccess(decodedData)
                } catch {
                    onFailed(error)
                }
            }
        }
        task.resume()
    }
    
}
