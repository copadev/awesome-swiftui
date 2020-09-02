//
//  preview-layout-on-muiltiple-devices.swift
//  
//  Created by Huy D. on 9/1/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import Foundation

// Preview Layout on muiltiple devices

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}


