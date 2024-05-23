//
//  ListingDetailsView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/19/24.
//

import SwiftUI
import MapKit // for mapView

struct ListingDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32) // since it is going behind the phone screen as we said ignore safe area.
                    // another thing is we should not put it for whole button it should be for the image because if we put for whole button eventhough it is visible the frame is still behind the screen
                }
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text("Miami Villa")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2){
                        RatingView(rating: 4.86)
                        
                        Text("•")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // Host Info View
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire Villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("male-profile-photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // Listing Features of the Property
            VStack(alignment: .leading, spacing: 16) {
                ForEach(0..<2) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experience, highly rated hosts who are commited to providing great experience for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer() // this is on the right side of superhost - ee spacer
                    }
                }
            }
            .padding()
            
            Divider()
            
            // Bedrooms View
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) { //if you put true it will show horizontal indicator for scrolling
                    HStack(spacing: 16){
                        ForEach(1..<5) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                
                                Text("bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging) // this adds paging effect to the horizontal scroll, i.e., there will be sort of locking effect if not scrolled enough rather than free flow of scrolling
            }
            .padding()
            
            Divider()
            
            // Listing Amenities View
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(0..<5){ feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // Map View
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)  // this is to not show tabBar(main tabbar) when you are inside listing details, becuase you already have a bar below 
        .ignoresSafeArea() // this will make screen go over the notch above
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailsView()
}
