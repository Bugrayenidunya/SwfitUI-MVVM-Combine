//
//  Service.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 22.01.2021.
//

import Combine
import Foundation

class Service {
    
    func fetchRestaurantsByLocation() -> AnyPublisher<Restaurants, Error> {
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?location=Istanbul") else {
            fatalError("Invalid Url")
        }
        
        var request = URLRequest(url: url)
        request.setValue(Constant.Api.apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Restaurants.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchRestaurantById(id: String) -> AnyPublisher<Restaurant, Error> {
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/\(id)") else {
            fatalError("Invalid Url")
        }
        
        var request = URLRequest(url: url)
        request.setValue(Constant.Api.apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Restaurant.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
