//
//  RestaurantCardView.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 23.01.2021.
//

import Kingfisher
import SwiftUI

struct RestaurantCardView: View {

    // MARK: Properties
    
    var restaurant: Restaurant?
    
    // MARK: Body
    
    var body: some View {
        
        let url = URL(string: restaurant?.imageURL ?? "")
        
        HStack {
            
            KFImage(url)
                .placeholder {
                    // Placeholder while downloading.
                    Image("meal")
                        .resizable()
                        .frame(width: 125, height: 125)
                        .cornerRadius(24)
                        .opacity(0.3)
                }
                .resizable()
                .frame(width: 125, height: 125)
                .cornerRadius(24)
            
            
            VStack(alignment: .leading) {
                Text((restaurant?.name)!)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.vertical)
                    
                    Text("\((restaurant?.rating)!, specifier: "%.1f")")
                } //: HSTACK
                
            } //: VSTACK
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(8)
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemFill))
                .clipShape(Circle())
            
        } //: HSTACK
        .frame(height: 150)
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView()
            .previewLayout(.sizeThatFits)
    }
}
