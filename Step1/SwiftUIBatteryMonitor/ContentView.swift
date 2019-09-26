//
//  ContentView.swift
//  SwiftUIBatteryMonitor
//
//  Created by 能登 要 on 2019/09/26.
//  Copyright © 2019 能登 要. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var rootState: Root

    func createBoard(item: Int) -> some View {
        ZStack {
            if item == 0 {
                BoardView(index: item)
            } else {
                BoardView(index: item)
                
                VStack(alignment: .leading, spacing: 5.0) {
                    HStack {
                        Text(self.rootState.batteries[item].level.count > 0 ? self.rootState.batteries[item].state : "")
                            .font(Font.custom("Futura-Medium", size: 17))
                            .foregroundColor(self.rootState.batteries[item].textColor )
                        Spacer()
                    }
                    
                    HStack {
                        Text( self.rootState.batteries[item].level.count > 0 ? self.rootState.batteries[item].deviceName : "")
                            .font(Font.custom("Futura-Medium", size: 15))
                            .foregroundColor(self.rootState.batteries[item].textColor)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(10)
            }
        }

    }
    
    var body: some View {
        ZStack() {
            VStack(spacing: 0) {
                ForEach(0 ..< 4) { item in
                    LevelVisualizeView(index: item)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .fill(Color.white.opacity(0.01))

            VStack(spacing: 0) {
                ForEach(0 ..< 4) { item in
                    self.createBoard(item: item)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var rootState = Root()
    static var previews: some View {
        ContentView()
        .environmentObject(rootState)
    }
}
