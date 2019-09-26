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

    func createSection(item: Int) -> some View {
        Section( header: Text("Slot\(item + 1)")){
            HStack {
                TextField("Level", text: self.$rootState.batteries[item].level)
                if self.rootState.batteries[item].level.count > 0 {
                    Image( systemName: "xmark.circle.fill")
                        .foregroundColor(Color(UIColor.placeholderText))
                        .gesture(
                            TapGesture()
                            .onEnded{ _ in
                                self.rootState.batteries[item].level = ""
                            }
                    )
                }
            }
            
            if item != 0 {
                HStack {
                    TextField("State", text: self.$rootState.batteries[item].state)
                    if self.rootState.batteries[item].state.count > 0 {
                        Image( systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .gesture(
                                TapGesture()
                                .onEnded{ _ in
                                    self.rootState.batteries[item].state = ""
                                }
                        )
                    }
                }
                
                HStack {
                    TextField("State", text: self.$rootState.batteries[item].deviceName)
                    if self.rootState.batteries[item].deviceName.count > 0 {
                        Image( systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .gesture(
                                TapGesture()
                                .onEnded{ _ in
                                    self.rootState.batteries[item].deviceName = ""
                                }
                        )
                    }
                }
            }
        }
    }
    
    var body: some View {
        List {
            self.createSection(item: 0)
            
            ForEach(1 ..< 4) { item in
                self.createSection(item: item)
            }

        }.listStyle(GroupedListStyle())
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
