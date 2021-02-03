//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  Awesome-SwiftUI
//  LazyVGrid.swift
//
//  Created by Huy D. on 1/29/21.
//  Credit to Kavsoft.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .black, .yellow, .purple, .orange]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0...15, id: \.self) { index in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        VStack (alignment: .leading, spacing: 15) {
                            Text("Cell \(index)")
                                .frame(height: 75)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(colors.randomElement())
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 25)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
