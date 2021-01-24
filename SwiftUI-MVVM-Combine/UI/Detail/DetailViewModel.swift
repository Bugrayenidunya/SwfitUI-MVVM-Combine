//
//  DetailViewModel.swift
//  SwiftUI-MVVM-Combine
//
//  Created by Bugra's Mac on 23.01.2021.
//

import Combine
import Foundation

class DetailViewModel: ObservableObject {
    @Published var restaurant: Restaurant? = nil
}
