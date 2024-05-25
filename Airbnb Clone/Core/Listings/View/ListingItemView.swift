//
//  ListingView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/16/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8) {
            // images
            
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text(listing.city)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer()
                // rating
                RatingView(rating: Float(listing.rating))
            }
            .font(.footnote)
        }
        // not adding padding here because we are adding it in the parent view
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
