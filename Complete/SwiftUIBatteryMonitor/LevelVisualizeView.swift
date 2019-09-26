//
//  LevelVisualizeView.swift
//  SwiftUIBatteryMonitor
//
//  Created by 能登 要 on 2019/09/16.
//  Copyright © 2019 能登 要. All rights reserved.
//

import SwiftUI

struct LevelVisualizeView: View {
    var index: Int
    @EnvironmentObject var rootState: Root

    var body: some View {
        return ZStack {
            GeometryReader { geometry in
                Rectangle().fill(Color.clear)
                    .background(
                        RadialGradient(gradient: .init(colors: self.rootState.batteries[self.index].backgroundColors), center: .init(x: 0.5, y: 0.5), startRadius: geometry.size.width * 0.245, endRadius: geometry.size.width * 1.133)
                        .aspectRatio(contentMode: .fill)
                    )
                        .clipped()
            }
        }
    }
}

struct LevelVisualizeView_Previews: PreviewProvider {
    static var rootState = Root()
    static var previews: some View {
        LevelVisualizeView( index: 1)
            .environmentObject(rootState)
    }
}
