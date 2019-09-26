//
//  BoardView.swift
//  SwiftUIBatteryMonitor
//
//  Created by 能登 要 on 2019/07/24.
//  Copyright © 2019 能登 要. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    var index: Int
    @EnvironmentObject var rootState: Root
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.clear)

            if self.rootState.batteries[index].level.count > 0 {
                GeometryReader { geometry in
                    HStack{
                        Text(self.rootState.batteries[self.index].level)
                            .font(Font.custom("Futura-Medium", size: geometry.size.height * 0.300))
                            .foregroundColor(self.rootState.batteries[self.index].textColor)
                        
                        Text("%")
                            .font(Font.custom("Futura-Medium", size: geometry.size.height * 0.133))
                            .foregroundColor(self.rootState.batteries[self.index].textColor)
                            .offset(CGSize(width: -geometry.size.height * 0.05,
                                           height: -geometry.size.height * 0.12))
                    }
                    .offset(CGSize(width: geometry.size.height * 0.0738, height: 0))
                }
            }
        }
    }
}

#if DEBUG
struct BoardView_Previews: PreviewProvider {
    static var rootState = Root()

    static var previews: some View {
        return BoardView(index: 1)
            .background(Color.gray)
            .environmentObject(rootState)
    }
}
#endif
