//
//  LoginButton.swift
//  Airbnb Clone
//
//  Created by Surya on 5/22/24.
//

import SwiftUI

struct LoginButton: View {
    var body: some View {
        Button {
            print("Log in")
        } label: {
            Text("Log in")
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    LoginButton()
}
