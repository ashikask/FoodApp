//
//  PizzaDetailView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct PizzaDetailView: View {
    var pizzas: [PizzaDetail]
    @State private var pizzaIndex = 0
    @State private var showBaseImageHeader = false
    @State private var showImageHeader = false
    @State private var showContent = false
    
    
    var body: some View {
        VStack {
            if showBaseImageHeader {
                PizzaImageHeaderView(
                    pizza: pizzas[pizzaIndex],
                    pizzas: pizzas,
                    showImageHeader: $showImageHeader,
                    pizzaIndex: $pizzaIndex
                )
                .opacity(showBaseImageHeader ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: showBaseImageHeader)
            }
            
            if showContent {
                PizzaDetailContentView(pizza: pizzas[pizzaIndex])
                    .transition(.move(edge: .bottom))
            }
            Spacer()
            AddToCartView()
        }
        .padding(.top, 30)
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(pizzas[pizzaIndex].name)
                    .font(.headline)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    // Add action for cart button
                }) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.black)
                        .badge(2)
                }
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.5)) {
                showBaseImageHeader = true
            }
            withAnimation(.easeIn(duration: 0.5).delay(0.5)) {
                showImageHeader = true
            }
            
            withAnimation(.easeIn(duration: 0.5).delay(0.7)) {
                showContent = true
            }
            
           
        }
    }
    
    
    private func handleSwipe(_ direction: SwipeDirection) {
        withAnimation(.easeInOut) {
            switch direction {
            case .left:
                if pizzaIndex < pizzas.count - 1 {
                    pizzaIndex += 1
                }
            case .right:
                if pizzaIndex > 0 {
                    pizzaIndex -= 1
                }
            }
        }
    }
}

struct AddToCartView: View {
    @State private var quantity = 1
    var body: some View {
        ZStack {
            
            HStack {
                Stepper(value: $quantity, in: 1...10) {
                }
                .labelsHidden()
                .padding()
                
                Spacer()
                
                Button(action: {}) {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
            .frame(height: 60)
            .padding(.top, 4)
            .background(Color.white)
            .shadow(radius: 10)
            
        }
    }
}
struct PizzaDetailContentView: View {
    var pizza: PizzaDetail
    var body: some View {
        
       
        VStack(alignment: .leading, spacing: 16) {
            Text("$\(String(format: "%.2f", pizza.price))")
                .font(.title)
                .bold()
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(0..<5) { star in
                            Image(systemName: star < 4 ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                            
                        }
                        Text(String(format: "%.1f", 4.8))
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "scooter")
                        Text("12 mins delivery")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                HStack(spacing: 16) {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .shadow(radius: 3)
                        .overlay {
                            Image(systemName: "chevron.left")
                        }
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .shadow(radius: 3)
                        .overlay {
                            Image(systemName: "chevron.right")
                        }
                    
                }
            }
            
            
            Picker("", selection: .constant(1)) {
                Text("Details").tag(1)
                Text("Customize").tag(0)
                Text("Reviews").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical, 10)
            
            Text(pizza.description)
                .font(.body)
                .lineLimit(nil)
               
            
        }
        .padding()
    }
    
}

enum SwipeDirection {
    case left, right
}

struct PizzaImageHeaderView: View {
    var pizza: PizzaDetail
    var pizzas: [PizzaDetail]
    @Binding var showImageHeader: Bool
    @Binding var pizzaIndex: Int
    @State private var offset: CGSize = .zero
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0
    @State private var incomingOffset: CGSize = CGSize(width: UIScreen.main.bounds.width * 2, height: 0)
    @State private var incomingScale: CGFloat = 0.3
    @State private var incomingRotation: Double = 0
    @State private var isSwipingLeft: Bool = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("base")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.clear)
                .frame(width: 400, height: 400)
                .zIndex(0)

            GeometryReader { geometry in
                ZStack {
                    Image(pizza.imageName)
                        .resizable()
                        
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .offset(offset)
                        .offset(x: 50, y: 50)
                        .scaleEffect(scale)
                        .rotationEffect(.degrees(rotation))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    offset = gesture.translation
                                    let progress = gesture.translation.width / UIScreen.main.bounds.width
                                    scale = 1 - abs(progress * 0.3)
                                    rotation = Double(gesture.translation.width / -20) // Adjust rotation direction

                                    if gesture.translation.width < 0 {
                                        isSwipingLeft = true
                                        incomingOffset = CGSize(width: UIScreen.main.bounds.width + gesture.translation.width, height: 0)
                                        incomingScale = 0.3 + (-progress * 0.7)
                                        incomingRotation = Double(gesture.translation.width / 20) // Adjust rotation direction
                                    } else {
                                        isSwipingLeft = false
                                        incomingOffset = CGSize(width: -UIScreen.main.bounds.width + gesture.translation.width, height: 0)
                                        incomingScale = 0.3 + (progress * 0.7)
                                        incomingRotation = Double(gesture.translation.width / -20) // Adjust rotation direction
                                    }
                                }
                                .onEnded { gesture in
                                    if gesture.translation.width < -100 {
                                        // Swiped left
                                        withAnimation {
                                            offset = CGSize(width: -UIScreen.main.bounds.width, height: 0)
                                            scale = 0.5
                                            rotation = 45 // Adjust rotation direction
                                        }
                                        withAnimation {
                                            incomingOffset = .zero
                                            incomingScale = 1.0
                                            incomingRotation = 0
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            pizzaIndex = (pizzaIndex + 1) % pizzas.count
                                            resetCardStates()
                                        }
                                    } else if gesture.translation.width > 100 {
                                        // Swiped right
                                        withAnimation {
                                            offset = CGSize(width: UIScreen.main.bounds.width, height: 0)
                                            scale = 0.5
                                            rotation = -45 // Adjust rotation direction
                                        }
                                        withAnimation {
                                            incomingOffset = .zero
                                            incomingScale = 1.0
                                            incomingRotation = 0
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            pizzaIndex = (pizzaIndex - 1 + pizzas.count) % pizzas.count
                                            resetCardStates()
                                        }
                                    } else {
                                        // Revert to original position
                                        withAnimation {
                                            offset = .zero
                                            scale = 1.0
                                            rotation = 0
                                            incomingOffset = CGSize(width: isSwipingLeft ? UIScreen.main.bounds.width * 2 : -UIScreen.main.bounds.width * 2, height: 0)
                                            incomingScale = 0.3
                                            incomingRotation = 0
                                        }
                                    }
                                }
                        )
                        .zIndex(1)
                    if pizzaIndex < pizzas.count - 1 && isSwipingLeft {
                        Image(pizzas[pizzaIndex + 1].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                            .offset(incomingOffset)
                            .scaleEffect(incomingScale)
                            .rotationEffect(.degrees(incomingRotation))
                            .animation(.easeInOut(duration: 0.5), value: incomingOffset)
                            .animation(.easeInOut(duration: 0.5), value: incomingScale)
                            .animation(.easeInOut(duration: 0.5), value: incomingRotation)
                            .opacity(incomingOffset.width >= UIScreen.main.bounds.width * 1.5 ? 0 : 1) // Start invisible
                            .zIndex(2) // Set incoming card on top
                    } else if pizzaIndex > 0 && !isSwipingLeft {
                        Image(pizzas[pizzaIndex - 1].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                            .offset(incomingOffset)
                            .scaleEffect(incomingScale)
                            .rotationEffect(.degrees(incomingRotation))
                            .animation(.easeInOut(duration: 0.5), value: incomingOffset)
                            .animation(.easeInOut(duration: 0.5), value: incomingScale)
                            .animation(.easeInOut(duration: 0.5), value: incomingRotation)
                            .opacity(incomingOffset.width <= -UIScreen.main.bounds.width * 1.5 ? 0 : 1) // Start invisible
                            .zIndex(2) // Set incoming card on top
                    }
                }
            }

            VStack {
                Button(action: {}) {
                    Image(systemName: "heart.fill")
                        .padding()
                        .font(.title)
                        .foregroundColor(.red)
                }
                .padding([.top, .trailing], 20)
            }
            Spacer()
        }
        .onAppear {
            resetCardStates()
        }
    }

    private func resetCardStates() {
        offset = .zero
        scale = 1.0
        rotation = 0
        incomingOffset = CGSize(width: isSwipingLeft ? UIScreen.main.bounds.width * 2 : -UIScreen.main.bounds.width * 2, height: 0)
        incomingScale = 0.3
        incomingRotation = 0
    }
}


#Preview {
    PizzaDetailView(pizzas: PizzaDetail.mockData)
}
