//
//  CategoriesView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var path: NavigationPath
    @Binding var selectedFilter: Category?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
            if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding()
                        .background(
                          Circle()
                            .stroke(lineWidth: 1)
                        )
                        .foregroundColor(.green)
                        .onTapGesture {
                            
                                self.selectedFilter = nil
                            
                        }
                        .transition(.move(edge: .leading))
                }
                
                ForEach(Category.mock) { category in
                    if selectedFilter == nil || selectedFilter == category
                    {
                        Button {
                            self.selectedFilter = category
                           // path.append(category.name)
                        } label: {
                            HStack {
                                Image(category.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                Text(category.name)
                                    .font(.caption)
                                    .foregroundStyle(.black)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedFilter == category ? .green : .white)
                            .cornerRadius(30)
                            .shadow(radius: 0.5)
                            
                        }
                    }
                }
            }
            .padding(.vertical, 10)
        }
        .animation(.bouncy, value: selectedFilter)
    }
}

#Preview {
    CategoriesView(path: .constant(NavigationPath()), selectedFilter: Binding(get: {
        Category.mock.first
    }, set: { _ in
        
    }))
}
