//
//  ExploreService.swift
//  Airbnb Clone
//
//  Created by Surya on 5/25/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] { // this is used to do the API call but here we are mocking the data from developerPreview
        return DeveloperPreview.shared.listings
    }
}
