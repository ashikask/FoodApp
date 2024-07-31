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
                                ForEach(Fetaure.mock) { feature in                          FeatureCardView(feature: feature)
                                        
                                        .scrollTransition { content, phase in
                                            
                                            content
                                                .opacity(phase.isIdentity ? 1: 0.5)
                                                .scaleEffect(x: phase.isIdentity ? 1: 0.9, y: phase.isIdentity ? 1: 0.9)
                                                .offset(y: phase.isIdentity ? 0: 5)
                                            
                                        }
                                    .frame(width: 320, height: 250)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .contentMargins(16, for: .scrollContent)
                        .scrollTargetBehavior(.viewAligned)
                        
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
    
}

#Preview {
    HomeMenuView()
}
