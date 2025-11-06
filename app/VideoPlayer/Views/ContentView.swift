//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Michael Gauthier on 2025-10-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                VideoPlayerView()
                    .frame(width: geometry.size.width, height: geometry.size.width * 9 / 16, alignment: .center)
                VideoDescriptionView()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
