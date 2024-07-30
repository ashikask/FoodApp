//
//  PizzaListView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct PizzaListView: View {
    @Binding var path: NavigationPath
    let pizzas: [Pizza] = Pizza.mockPizzas
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(pizzas) { pizza in
                    NavigationLink(value: PizzaDetail(name: pizza.name, price: pizza.price, description: "Topped with just olive oil, pecorino cheese, salt and pepper, and cream, Cacio e Pepe pizza is surprisingly satisfying and packed with flavor. Pair it with red wine and arugula salad for a simple yet sophisticated meal....", imageName: pizza.imageName)) {
                        CardViewItems(imageName: pizza.imageName, itemName: pizza.name, price: pizza.price, width: 120, height: 120)
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    PizzaListView(path: .constant(NavigationPath()))
}
