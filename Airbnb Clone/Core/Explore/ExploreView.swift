//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/16/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchAndFilterBar() // if you want to stick the search bar at top, you can put this outside scrollView in a VStack
                LazyVStack(spacing: 32) {
                    ForEach (0 ... 10, id: \.self) { listing in
                        NavigationLink(value: listing, label: {
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        })
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self) { listing in
                Text("Listing details View")
            }
        }
    }
}

#Preview {
    ExploreView()
}
 
