//
//  CustomTabView-1.swift
//
//  Created by Huy D. on 9/8/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        VStack {
            Spacer()
            Text("Tab Index: \(index)")
            Spacer()
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation {
                        self.index = 0
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "house.fill")
                            .foregroundColor(index == 0 ? .white : Color.black.opacity(0.35))
                            .padding(10)
                            .background(index == 0 ? .black : Color.clear)
                            .cornerRadius(8)
                        Text(index == 0 ? "Home" : "")
                            .foregroundColor(.black)
                    }
                }
                Spacer(minLength: 0)
                Button(action: {
                    withAnimation {
                        self.index = 1
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "suit.heart")
                            .foregroundColor(index == 1 ? .white : Color.black.opacity(0.35))
                            .padding(10)
                            .background(index == 1 ? .black : Color.clear)
                            .cornerRadius(8)
                        Text(index == 1 ? "Loved" : "")
                            .foregroundColor(.black)
                    }
                }
                Spacer(minLength: 0)
                Button(action: {
                    withAnimation {
                        self.index = 2
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "person.fill")
                            .foregroundColor(index == 2 ? .white : Color.black.opacity(0.35))
                            .padding(10)
                            .background(index == 2 ? .black : Color.clear)
                            .cornerRadius(8)
                        Text(index == 2 ? "Account" : "")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal, 25)
            .padding(.bottom)
            .background(Color.yellow)

        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}


