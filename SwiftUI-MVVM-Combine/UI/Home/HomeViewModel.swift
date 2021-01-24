//
//  HomeViewModel.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 22.01.2021.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var restaurants = [Restaurant]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        self.cancellable = Service().fetchRestaurantsByLocation()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { restaurants in
                self.restaurants = restaurants.restaurant!
            })
    }
    
}
