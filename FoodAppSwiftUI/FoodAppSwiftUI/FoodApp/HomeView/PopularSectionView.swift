//
//  PopularSectionView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct PopularSectionView: View {
    let items: [PopularItem]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(items) { popularItem in
                    CardViewItems(imageName: popularItem.imageName, itemName: popularItem.name, price: popularItem.price)
                }
            }
            .padding()
        }
    }
}

#Preview {
    PopularSectionView(items: PopularItem.mock)
}
