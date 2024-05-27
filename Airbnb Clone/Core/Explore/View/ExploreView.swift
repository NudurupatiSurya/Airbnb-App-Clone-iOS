//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/16/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView { // this is for custom view for Search bar
                DestinationSearchView(show: $showDestinationSearchView, viewModel : viewModel)
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        } // if you want to stick the search bar at top, you can put this outside scrollView in a VStack
                    LazyVStack(spacing: 32) {
                        ForEach (viewModel.listings, id: \.self) { listing in
                            NavigationLink(value: listing, label: {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            })
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailsView(listing: listing)
                        .navigationBarBackButtonHidden() // this will hide the nav_bar, because we ignored safe spaced before it will make sure there is no nav bar which will overlay on top of our content
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
 
