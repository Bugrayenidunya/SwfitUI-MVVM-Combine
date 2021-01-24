//
//  HomeView.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 22.01.2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            
            List(viewModel.restaurants, id: \.id) { item in
                NavigationLink(destination: DetailView(restaurant: item)) {
                    RestaurantCardView(restaurant: item)
                }
                
            } //: LIST
            .navigationBarTitle("Restaurants")
            
        } //: NAVIGATIONVIEW
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
