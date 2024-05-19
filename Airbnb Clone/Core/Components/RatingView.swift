//
//  RatingView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/19/24.
//

import SwiftUI

struct RatingView: View {
    var rating: Float
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            
            Text("\(Float(rating), specifier: "%0.2f")")
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingView(rating: 4.86)
}
