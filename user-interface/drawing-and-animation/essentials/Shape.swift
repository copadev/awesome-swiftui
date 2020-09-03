//
//  Shape.swift
//
//  Created by Huy D. on 9/3/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

// MARK: - Using Shape in SwiftUI

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}


// MARK: - How to use (demo)

struct ContentView: View {
    @State var tabIndex = 0
    var body: some View {
        VStack {
            Spacer()
            Text("Tap Index: #\(tabIndex)")
                .foregroundColor(.black)
            Spacer()
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                Button(action: {
                    self.tabIndex = 0
                }) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 20))
                        .foregroundColor(self.tabIndex == 0 ? .white : Color.black)
                        .padding(.all)
                        .background(Color.black.opacity(self.tabIndex == 0 ? 1 : 0))
                        .clipShape(Circle())
                }
                Spacer(minLength: 0)
                Button(action: {
                    self.tabIndex = 1
                }) {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 20))
                        .foregroundColor(self.tabIndex == 1 ? .white : Color.black)
                        .padding(.all)
                        .background(Color.black.opacity(self.tabIndex == 1 ? 1 : 0))
                        .clipShape(Circle())
                }
                Spacer(minLength: 0)
            }
            .padding(.top)
            .padding(.horizontal)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.yellow)
            .clipShape(CShape())
            .shadow(radius: 4)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


