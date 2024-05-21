//
//  DestinationSearchView.swift
//  Airbnb Clone
//
//  Created by Surya on 5/20/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
} // this will store the values entered by the user

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location // initially it is set to location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    var body: some View {
        VStack {
            HStack {
                    Button {
                        withAnimation(.snappy){
                            show.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark.circle")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                }
                
                Spacer()
                if !destination.isEmpty { // show the clear button only when the textField is not empty
                        Button("Clear") {
                            destination = ""
                        }
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    }
            }
            .padding()
            
            // Where to View
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search Destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "where", description: "Add destination")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location}
            }
            
            // Date Selection View
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates}
            }
            
            // Num guests View
            VStack {
                if selectedOption == .guests {
                    Text("Who's Coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests}
            }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsableDestinationViewModifier: ViewModifier { // custom modifier you can use this to reduce copy and pasted code by reusing this
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
