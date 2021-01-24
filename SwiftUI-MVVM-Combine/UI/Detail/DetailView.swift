//
//  DetailView.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 23.01.2021.
//

import Kingfisher
import SwiftUI

struct DetailView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel = DetailViewModel()
    
    // MARK: Init

    init(restaurant: Restaurant) {
        self.viewModel.restaurant = restaurant
    }
    
    // MARK: Body
    
    var body: some View {
        
        let url = URL(string: viewModel.restaurant?.imageURL ?? "")
        
        VStack(alignment: .leading) {
            
            KFImage(url)
                .placeholder {
                    // Placeholder while downloading.
                    Image("meal")
                        .resizable()
                        .frame(height: 300)
                }
                .resizable()
                .frame(height: 300)
            
            RestaurantDetailsView(restaurant: viewModel.restaurant!)
            
            Spacer()
            
        } //: VSTACK
        .navigationTitle("Detail")
    }
}

// MARK: Preview

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(restaurant: Restaurant(id: ""))
    }
}
