//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  BarChart.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/1/21.
//

import SwiftUI

let data = [
    Chart(id: 0, name: "Col 1", time: 480),
    Chart(id: 1, name: "Col 2", time: 880),
    Chart(id: 2, name: "Col 3", time: 250),
    Chart(id: 3, name: "Col 4", time: 360),
    Chart(id: 4, name: "Col 5", time: 1150),
    Chart(id: 5, name: "Col 6", time: 750),
    Chart(id: 6, name: "Col 7", time: 950)
]

struct ContentView: View {
    @State var selected = 0
    var colors: [Color] = [.red, .blue]
    var body: some View {
        HStack(spacing: 15) {
            ForEach(data) { work in
                VStack {
                    VStack {
                        Spacer(minLength: 0)
                        if selected == work.id {
                            Text(calculateHours(value: work.time))
                                .foregroundColor(.yellow)
                                .padding(.bottom, 5)
                        }
                        ColumnShape()
                            .fill(LinearGradient(gradient: .init(colors: selected == work.id ? colors : [Color.black.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                            .frame(height: calculateHeight(value: work.time))
                    }
                    .frame(height: 220)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            selected = work.id
                        }
                    }
                    Text(work.name)
                        .font(.caption)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .cornerRadius(10)
        .padding()
    }
}

struct ColumnShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft,.topRight],
                                cornerRadii: CGSize(width: 5, height: 5))
        return Path(path.cgPath)
    }
}

struct Chart: Identifiable {
    var id: Int
    var name: String
    var time: CGFloat
}

extension ContentView {
    
    // calculating Hrs For Height...
    func calculateHeight(value : CGFloat)->CGFloat{
        // the value in minutes....
        // 24 hrs in min = 1440
        let hrs = CGFloat(value / 1440) * 200
        return hrs
    }
    
    // getting hrs...
    func calculateHours(value: CGFloat)->String{
        let hrs = value / 60
        return String(format: "%.1f", hrs)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
