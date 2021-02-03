//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  NavigationBar-1.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/28/21.
//  Credit to Kavsoft
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: { }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    })
                    Spacer()
                    Button(action: { }, label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    })
                }
                VStack(spacing: 5) {
                    Text("CodePassion.dev")
                        .fontWeight(.bold)
                    Text("Active")
                        .font(.caption)
                }
                .foregroundColor(.white)
            }
            .padding(.all)
            VStack {
                Spacer()
                Text("Hello, CodePassion.dev 😜")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white.clipShape(RoundedShape()))
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.red.edgesIgnoringSafeArea(.all))
    }
}

struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
