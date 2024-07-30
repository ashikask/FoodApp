//
//  HomeMenuView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct HomeMenuView: View {
    @State private var path = NavigationPath()
    @State private var selectedFilter: Category? = nil
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                MenuBarView()
                Divider()
                    .padding(.top)
                CategoriesView(path: $path, selectedFilter: $selectedFilter)
                if selectedFilter != nil {
                    PizzaListView(path: $path)
                        .transition(.move(edge: .bottom))
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Fetaure.mock) { feature in
                                    GeometryReader { geometry in
                                        FeatureCardView(feature: feature)
                                            .opacity(self.opacity(for: geometry))
                                            .offset(y: self.offset(for: geometry))
                                    }
                                    .frame(width: 350, height: 250)
                                }
                            }
                            .padding()
                        }
                        SectionFoodHeaderView(title: "Popular")
                        PopularSectionView(items: PopularItem.mock)
                        SectionFoodHeaderView(title: "Promotions")
                        PopularSectionView(items: PopularItem.mock)
                        Spacer()
                    }
                }
            }
            .animation(.easeInOut, value: selectedFilter)
            .navigationTitle("")
            .navigationDestination(for: PizzaDetail.self) { pizza in
                PizzaDetailView(pizzas: PizzaDetail.mockData)
                   .toolbar(.hidden, for: .tabBar)
            }
        }
    }
    
    private func opacity(for geometry: GeometryProxy) -> Double {
        let midX = geometry.frame(in: .global).midX
        let screenWidth = UIScreen.main.bounds.width
        let halfScreenWidth = screenWidth / 2
        let distance = abs(midX - halfScreenWidth)
        return max(1 - (distance / halfScreenWidth), 0.5)
    }

    private func offset(for geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let screenWidth = UIScreen.main.bounds.width
        let halfScreenWidth = screenWidth / 2
        let distance = abs(midX - halfScreenWidth)
        return min(distance / 10, 50)
    }
    
    
}

#Preview {
    HomeMenuView()
}
