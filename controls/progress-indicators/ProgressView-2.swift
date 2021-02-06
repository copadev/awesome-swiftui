//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  ProgressView-2.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/6/21.
//  Credit to WWDC 2020
//  https://developer.apple.com/videos/play/wwdc2020/10643/
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.0
    var body: some View {
        VStack(spacing: 30) {
            ProgressView(progress)
            ProgressView(progress)
                .environment(\.colorScheme, .dark)
            Button(action: increaseProgress) {
                Text("Increase Progress")
            }
        }
        .padding(20)
        .background(Color(UIColor.secondarySystemBackground))
    }
    
    func increaseProgress() {
        withAnimation {
            progress += 0.05
        }
    }
}

public struct ProgressView: View {
    
    let gradientColors: [Color] = [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))]
    let sliceSize = 0.35
    var progress: Double
    
    
    private let percentageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()
    
    public init(_ progress: Double = 0.3) {
        self.progress = progress
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                    Circle()
                        .trim(from: 0, to: 1 - CGFloat(self.sliceSize))
                        .stroke(self.strokeGradient,
                                style: self.strokeStyle(with: geometry))
                        .opacity(0.5)
                    Circle()
                        .trim(from: 0, to:  (1 - CGFloat(self.sliceSize)) * CGFloat(self.progress))
                        .stroke(self.strokeGradient,
                                style: self.strokeStyle(with: geometry))
                }.rotationEffect(.degrees(90) + .degrees(360 * self.sliceSize / 2 ))
                
                if self.progress > 0.995 {
                    Image(systemName: "star.fill")
                        .font(.system(size: 0.4 * min(geometry.size.width,geometry.size.height),weight: .bold, design: .rounded))
                        .foregroundColor(Color.yellow)
                        .offset(y: -0.05 * min(geometry.size.width,geometry.size.height))
                        .animation(nil)
                } else {
                    Text(self.percentageFormatter.string(from: self.progress as NSNumber)!)
                        .font(.system(size: 0.3 * min(geometry.size.width, geometry.size.height), weight: .bold, design: .rounded))
                        .offset(y: -0.05 * min(geometry.size.width,geometry.size.height))
                        .animation(nil)
                }
            }
            .offset(y: 0.1 * min(geometry.size.width,geometry.size.height))
        }
        .padding(40)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
    }
    
    private var strokeGradient: AngularGradient {
        return AngularGradient(gradient: Gradient(colors: self.gradientColors), center: .center, angle: .degrees(-10))
    }
    
    private func strokeStyle(with geometry: GeometryProxy) -> StrokeStyle {
        return StrokeStyle(lineWidth: 0.12 * min(geometry.size.width, geometry.size.height), lineCap: .round)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
