//
//  FeatureCardView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct FeatureCardView: View {
    let feature: Fetaure

    var body: some View {
        VStack(alignment: .leading) {
            Image(feature.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 150)
                .clipped()
                .overlay(alignment: .bottomLeading) {
                    HStack {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                                .overlay(
                                    Image("burger")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                )
                        }
                        Text(feature.name)
                            .font(.headline)
                            .offset(y: 10)
                    }
                    .offset(x: 10, y: 40)
                }
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "scooter")
                    Text(feature.delivery)
                        .font(.subheadline)
                }
                .foregroundColor(.gray)
                HStack {
                    ForEach(0..<4) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Image(systemName: "star.leadinghalf.fill")
                        .foregroundColor(.yellow)
                    Text("4.8")
                }
            }
            .padding(.top, 10)
            .padding(20)
        }
        
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

#Preview {
    FeatureCardView(feature: Fetaure.mock[0])
}

