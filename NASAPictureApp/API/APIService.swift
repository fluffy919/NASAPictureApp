//
//  APIService.swift
//  NASAPictureApp
//
//  Created by David on 3/6/22.
//

import Foundation

class APIService: NSObject {
    
    private let sourceURL = "https://api.nasa.gov/planetary/apod"
    private let apiKey = "uZd0rABdb53DXcJrjSihTHEvT5AY9yhjlDgH3lSE"
    
    func getNasaData(date: String?, completion : @escaping (Nasa) -> ()){
        var url = URL(string: "\(sourceURL)?api_key=\(apiKey)")!
        if let date = date {
            url = URL(string: "\(sourceURL)?api_key=\(apiKey)&date=\(date)")!
        }
        
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let nasaData = try jsonDecoder.decode(Nasa.self, from: data)
                    completion(nasaData)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
