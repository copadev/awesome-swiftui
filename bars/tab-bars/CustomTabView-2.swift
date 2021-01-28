//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  CustomTabView-2.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/27/21.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex = 1
    var body: some View {
        VStack {
            Spacer()
            Text("Tab Index: \(tabIndex)")
            Spacer()
            let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom
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
            .padding(.bottom, bottomInset == 0 ? 15 : bottomInset)
            .background(Color.yellow)
            .clipShape(CShape())
            .shadow(radius: 4)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
