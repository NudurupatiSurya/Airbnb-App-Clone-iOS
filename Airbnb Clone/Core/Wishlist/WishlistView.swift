//
//  WishlistView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/22/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                
                LoginButton()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}
    
    #Preview {
        WishlistView()
    }
