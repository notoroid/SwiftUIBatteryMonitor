//
//  PreferencesView.swift
//  SwiftUIBatteryMonitor
//
//  Created by 能登 要 on 2019/09/26.
//  Copyright © 2019 能登 要. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    @Binding var isModal: Bool
    @EnvironmentObject var rootState: Root

    var body: some View {
        Text("HellowWorld")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    @State static var isModal = true
    static var rootState = Root()

    static var previews: some View {
        PreferencesView(isModal: Self.$isModal)
            .environmentObject(Self.rootState)
    }
}
