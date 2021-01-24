//
//  RetaurantDetailsView.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 24.01.2021.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    // MARK: Properties
    
    var restaurant: Restaurant
    
    // MARK: Body
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(restaurant.name ?? "Null")
                .font(.title)
                .bold()
                .padding(.top)
                .multilineTextAlignment(.leading)
            
            HStack(alignment: .bottom) {
                Image(systemName: "star.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.yellow)
                Text("\((restaurant.rating ?? 0.0), specifier: "%.1f")")
                
                Text("(\(restaurant.reviewCount ?? 0))")
                    .foregroundColor(.secondary)

            } //: HSTACK
            .font(.system(size: 22))
            .padding(.top, 0)
            .padding(.bottom, 16)
            
            HStack {
                Image(systemName: "clock")
                Text(restaurant.isClosed ?? true ? "Closed" : "Open")
            }
            .padding(.bottom, 4)
            
            HStack {
                Image(systemName: "dollarsign.circle")
                Text(restaurant.price ?? "Null")
            }
            .padding(.bottom, 4)
            
            HStack {
                Image(systemName: "phone")
                Text(restaurant.phone ?? "Null")
            }
            .padding(.bottom, 4)
            
        } //: VSTACK
        .padding()
    }
}

// MARK: Preview

struct RetaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsView(restaurant: Restaurant(name: "Restaurant Name", isClosed: true, phone: "12345", reviewCount: 123, rating: 4.5, price: "$$$"))
            .previewLayout(.sizeThatFits)
    }
}
