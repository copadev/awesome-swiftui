//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  ContentView.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/1/21.
//  Credit to Kavsoft.
//

import SwiftUI

let dataList = [
    Ring(id: 0, title: "Running", currentData: 8.8, goalData: 15, color: Color.red),
    Ring(id: 1, title: "Water", currentData: 3.0, goalData: 5, color: Color.green),
    Ring(id: 2, title: "Energy Burn", currentData: 725, goalData: 1000, color: Color.yellow),
    Ring(id: 3, title: "Sleep", currentData: 5.2, goalData: 10, color: Color.blue),
    Ring(id: 4, title: "Cycling", currentData: 12.5, goalData: 25, color: Color.purple),
    Ring(id: 5, title: "Steps", currentData: 16880, goalData: 20000, color: Color.orange),
]

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(dataList) { data in
                    VStack(spacing: 22) {
                        HStack {
                            Text(data.title)
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer(minLength: 0)
                        }
                        ZStack {
                            let ringWidth = (UIScreen.main.bounds.width - 150) / 2
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(data.color.opacity(0.05), lineWidth: 10)
                                .frame(width: ringWidth, height: ringWidth)
                            Circle()
                                .trim(from: 0, to: (data.currentData / data.goalData))
                                .stroke(data.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                .frame(width: ringWidth, height: ringWidth)
                                .rotationEffect(.init(degrees: -90))
                            Text(getPercent(current: data.currentData, Goal: data.goalData) + " %")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                        Text(getDec(val: data.currentData) + getType(val: data.title))
                            .font(.system(size: 22))
                            .foregroundColor(Color.black.opacity(0.8))
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.black.opacity(0.06))
                    .cornerRadius(15)
                    .shadow(color: Color.white.opacity(0.1), radius: 10, x: 0, y: 0)
                }
            }
            .padding()
        }
    }
}

struct Ring : Identifiable {
    var id: Int
    var title: String
    var currentData: CGFloat
    var goalData: CGFloat
    var color: Color
}

extension ContentView {
    
    // calculating percent...
    func getPercent(current : CGFloat,Goal : CGFloat)->String{
        let per = (current / Goal) * 100
        return String(format: "%.1f", per)
    }
    
    // converting Number to decimal...
    func getDec(val: CGFloat)->String{
        let format = NumberFormatter()
        format.numberStyle = .decimal
        return format.string(from: NSNumber.init(value: Float(val)))!
    }
    
    // get type unit...
    func getType(val: String)->String{
        switch val {
        case "Water": return "L"
        case "Sleep": return "Hrs"
        case "Running": return "Km"
        case "Cycling": return "Km"
        case "Steps": return "stp"
        default: return "Kcal"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
