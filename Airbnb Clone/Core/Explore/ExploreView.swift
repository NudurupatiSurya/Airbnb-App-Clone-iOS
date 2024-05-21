//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/16/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView { // this is for custom view for Search bar
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        } // if you want to stick the search bar at top, you can put this outside scrollView in a VStack
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
                    ListingDetailsView()
                        .navigationBarBackButtonHidden() // this will hide the nav_bar, because we ignored safe spaced before it will make sure there is no nav bar which will overlay on top of our content
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
 
