//
//  FoodApp.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct FoodApp: View {
    var body: some View {
        TabView {
            HomeMenuView()
                .tabItem {
                    Image(systemName: "house.fill")
                    
                    Text("Home")
                }
            
            OrdersView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Orders")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            CartView()
                .tabItem {
                    
                        Image(systemName: "cart.fill")
                        
                        Text("Cart")
                    
                    
                }.badge(cartItemCount)
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        
        .accentColor(.green)
    }
    
    // Example cart item count
    var cartItemCount: Int {
        return 2
    }
}

struct OrdersView: View {
    var body: some View {
        Text("Order")
    }
}

struct SearchView: View {
    var body: some View {
        Text("SearchView")
    }
}

struct CartView: View {
    var body: some View {
        Text("CartView")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("SettingsView")
    }
}

#Preview {
    FoodApp()
}
