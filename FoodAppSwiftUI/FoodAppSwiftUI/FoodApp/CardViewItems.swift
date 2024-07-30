//
//  CardViewItems.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct CardViewItems: View {
    var imageName: String
    var itemName: String
    var price: Double
    var width: CGFloat = 150
    var height: CGFloat = 150
    var body: some View {
        VStack (alignment: .center) {
            Image(imageName)
                .resizable()
                .frame(width: width, height: height)
                .aspectRatio(contentMode: .fill)
                .clipped()
                
            
            
            VStack (alignment: .leading, spacing: 8){
                Text(itemName)
                    .foregroundColor(.black)
                    .font(.headline)
                
                HStack {
                    Text("$\(String(format: "%.2f", price))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Image(systemName: "plus.circle")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                        .font(.system(size: 25))
                    
                }
            }
            .padding(.top, 8)
                
        }
        .padding()
        
        .background(.white)
        .cornerRadius(8)
        .shadow(radius: 1)
        
    }
}

#Preview {
    CardViewItems(imageName: "pizza1", itemName: "text", price: 9.5)
}
