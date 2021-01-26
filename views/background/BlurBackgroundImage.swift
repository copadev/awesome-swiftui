//
//  BlurBackgroundImage.swift
//
//  Created by Huy D. on 9/3/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

// Blur Background Image in SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("image-background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width)
            .blur(radius: 35, opaque: true)
            Text("CodePassion.dev")
                .foregroundColor(.black)
                .fontWeight(.heavy)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


