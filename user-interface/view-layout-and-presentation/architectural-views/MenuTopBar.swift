//
//  MenuTopBar.swift
//
//  Created by Huy D. on 9/8/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

var topMenu = ["Shoes", "Clothing", "By Sports", "By Branch", "By Price"]

struct MenuTopBar: View {
    var menu: Int
    @Binding var index: Int
    var body: some View {
        VStack(spacing: 8) {
            Text(topMenu[menu])
                .font(.system(size: 22))
                .fontWeight(self.index == menu ? .bold : .none)
                .foregroundColor(self.index == menu ? .black : .gray)
            Circle()
                .fill(Color.black)
                .frame(width: 10, height: 10)
                .opacity(self.index == menu ? 1 : 0)
        }.onTapGesture {
            self.index = self.menu
        }
    }
}

struct ContentView: View {
    @State var topIndex = 0
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(0..<topMenu.count) {menu in
                        MenuTopBar(menu: menu, index: self.$topIndex)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 10)
            Spacer()
            Text("Tab: \(topMenu[topIndex])")
            Spacer()
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}


