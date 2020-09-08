//
//  CustomTabView-2.swift
//
//  Created by Huy D. on 9/8/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex = 1
    var body: some View {
        VStack {
            Spacer()
            Text("Tab Index: \(tabIndex)")
                .foregroundColor(.white)
            Spacer()
            HStack(spacing: 0) {
                Button(action: {
                    self.tabIndex = 0
                }) {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 20))
                        .foregroundColor(self.tabIndex == 0 ? .white : .black)
                        .padding(.all)
                        .background(Color.black.opacity(self.tabIndex == 0 ? 1 : 0))
                        .clipShape(Circle())
                }
                Spacer(minLength: 0)
                Button(action: {
                    self.tabIndex = 1
                }) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 20))
                        .foregroundColor(self.tabIndex == 1 ? .white : .black)
                        .padding(.all)
                        .background(Color.black.opacity(self.tabIndex == 1 ? 1 : 0))
                        .clipShape(Circle())
                }
                Spacer(minLength: 0)
                Button(action: {
                    self.tabIndex = 2
                }) {
                    Image(systemName: "cart.fill")
                        .font(.system(size: 20))
                        .foregroundColor(self.tabIndex == 2 ? .white : .black)
                        .padding(.all)
                        .background(Color.black.opacity(self.tabIndex == 2 ? 1 : 0))
                        .clipShape(Circle())
                }
            }
            .padding(.top)
            .padding(.horizontal)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.yellow)
            .clipShape(CShape())
            .shadow(radius: 4)
        }
        .background(Color(.lightGray).edgesIgnoringSafeArea(.all))
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
