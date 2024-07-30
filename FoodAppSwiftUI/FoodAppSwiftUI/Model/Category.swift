//
//  Category.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import Foundation
import SwiftUI

// -----PIZZA Model Data-----
// PizzaDetails
struct PizzaDetail: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let price: Double
    let description: String
    let imageName: String
}

extension PizzaDetail {
    static let mockData = [
        PizzaDetail(name: "Cream Pack Pizza", price: 29.00, description: "Topped with just olive oil, pecorino cheese, salt and pepper, and cream.", imageName: "pizza1"),
        PizzaDetail(name: "Margherita", price: 19.99, description: "Classic margherita pizza with fresh basil, mozzarella, and tomatoes.", imageName: "pizza2"),
        PizzaDetail(name: "Hawaiian", price: 21.99, description: "Delicious Hawaiian pizza with pineapple and ham.", imageName: "pizza3"),
        PizzaDetail(name: "Vegetarian", price: 18.99, description: "Healthy vegetarian pizza with a variety of fresh vegetables.", imageName: "pizza4"),
        PizzaDetail(name: "Pepperoni", price: 18.99, description: "Vegetarian Cheeze Pizza with a variety of fresh vegetables.", imageName: "pizza5")
    ]
}

// Pizza List Data
struct Pizza: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var imageName: String
}

extension Pizza {
    static let mockPizzas = [
        Pizza(name: "Cream Pack Pizza", price: 20.99, imageName: "pizza1"),
        Pizza(name: "Margherita", price: 19.99, imageName: "pizza2"),
        Pizza(name: "Hawaiian", price: 21.99, imageName: "pizza3"),
        Pizza(name: "Vegetarian", price: 18.99, imageName: "pizza4"),
        Pizza(name: "Pepperoni", price: 20.99, imageName: "pizza5"),
        Pizza(name: "Margherita", price: 19.99, imageName: "pizza2"),
        Pizza(name: "Hawaiian", price: 21.99, imageName: "pizza3"),
        Pizza(name: "Vegetarian", price: 18.99, imageName: "pizza4")
    ]
}

// -------HOME Model Data--------
// Feature Data for home screen
struct Fetaure: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let delivery: String
   
}
extension Fetaure {
    static var mock: [Fetaure] = [
        Fetaure(name: "Chicken Republic - Lekki", imageName: "featured_image", delivery: "12 mins delivery"),
        Fetaure(name: "Pizza Spot", imageName: "featured_image2", delivery: "12 mins delivery"),
        Fetaure(name: "Burger King", imageName: "featured_image3", delivery: "12 mins delivery")
    ]
}

// Category Data for home screen
struct Category: Hashable, Equatable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

extension Category {
    static var mock: [Category] = [
        Category(name: "Pizza", imageName: "pizza"),
        Category(name: "Burger", imageName: "burger"),
        Category(name: "Fried Chicken", imageName: "fried_chicken")
    ]
}

// PopularItem Data for home screen
struct PopularItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: Double
}

extension PopularItem {
    static var mock: [PopularItem] = [
        PopularItem(name: "Mighty meaty", imageName: "mighty_meaty_cheese", price: 9.00),
        PopularItem(name: "Mighty meaty", imageName: "mighty_meaty_cheese", price: 8.00)
    ]
}

