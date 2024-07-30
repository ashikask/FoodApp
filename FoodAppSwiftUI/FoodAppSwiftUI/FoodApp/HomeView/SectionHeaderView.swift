//
//  SectionHeaderView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct SectionFoodHeaderView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title).font(.headline)
            Spacer()
            Text("See all").font(.subheadline).foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SectionFoodHeaderView(title: "Popular")
}
