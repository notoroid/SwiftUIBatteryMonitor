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

    var body: some View {
        Text("Hellow World.")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var rootState = Root()
    static var previews: some View {
        ContentView()
        .environmentObject(rootState)
    }
}
