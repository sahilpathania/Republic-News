//
//  ApiManager.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import Foundation
class ApiManager {
    static let sharedInstance = ApiManager()
    /// This will the hit the News api and return the data in the form of completion handler
    /// - Parameters:
    ///   - countryCode: Country code of the selected country
    ///   - success: Contains data of NewsModel
    ///   - failure: Contains value in the form of bool 
    func callNewsApi(countryCode : String , success : @escaping(NewsModel) -> () , failure : @escaping(Bool) -> ()) {
        let apiKey = "64c0f0a608bb4a768c13d29ca1fad87e"
        let category = "entertainment"
        let country = countryCode
        let url = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(apiKey)&category=\(category)"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

            // Validation
            guard let data = data, error == nil else {
                print("something went wrong")
                failure(true)
                return
            }
            do {
                let weatherDataModel = try JSONDecoder().decode(NewsModel.self, from: data)
                success(weatherDataModel)
            }
            catch {
                print("error: \(error)")
                failure(true)
            }
        }).resume()
    }
}
