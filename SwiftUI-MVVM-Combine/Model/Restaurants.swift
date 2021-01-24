//
//  Restaurants.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 22.01.2021.
//

import Foundation

// MARK: - Restaurants

struct Restaurants: Codable {
    var total: Int?
    var restaurant: [Restaurant]?
    
    enum CodingKeys: String, CodingKey {
        case restaurant = "businesses"
        case total
    }
}

// MARK: - Restaurant

struct Restaurant: Codable, Identifiable {
    
    // MARK: - Properties
    
    var id, name: String?
    var imageURL: String?
    var isClosed: Bool?
    var url: String?
    var phone: String?
    var reviewCount: Int?
    var rating: Double?
    var price: String?
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case url, phone
        case reviewCount = "review_count"
        case rating, price
    }
}

