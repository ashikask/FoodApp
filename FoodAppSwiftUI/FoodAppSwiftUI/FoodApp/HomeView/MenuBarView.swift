//
//  MenuBarView.swift
//  MealFetch
//
//  Created by ashika kalmady on 7/28/24.
//

import SwiftUI

struct MenuBarView: View {
    var body: some View {
        HStack {
            Menu {
                Button {} label: {
                    Text("61 Hooper Street")
                }
                Button {} label: {
                    Text("Other")
                }
            } label: {
                HStack {
                    Image(systemName: "location.fill")
                    Text("61 Hooper Street")
                    Image(systemName: "chevron.down")
                }
            }
            .padding(.leading)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "gift.fill")
            }
            .padding(.trailing)
        }
        .foregroundColor(.black)
        .padding(.top)
    }
}

#Preview {
    MenuBarView()
}
