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
    @State var showSetteingButton = false
    @State var isModal: Bool = false

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
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            if value.translation.height <= -76.0 && abs(value.translation.width) < 36.0 {
                                self.isModal = true
                            }
                    }
                )

            VStack(spacing: 0) {
                ForEach(0 ..< 4) { item in
                    self.createBoard(item: item)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: self.$isModal){
                NavigationView {
                    PreferencesView(isModal: self.$isModal)
                        .navigationBarTitle(Text("設定"))
                        .navigationBarItems(leading:
                            Button(action: {
                                self.isModal = false
                            }, label: {
                                Image(systemName:"xmark")
                                    .renderingMode(.template)
                                    .font(.title)
                            }
                        )
                    )
                    .environmentObject(self.rootState)
                        // sheet で表示するダイアログはenvironmentObject を渡す必要あり
                }
                .navigationViewStyle(DefaultNavigationViewStyle())
            }


            if showSetteingButton {
                SettingIconView(foregroundColor: self.rootState.batteries[0].textColor)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            self.showSetteingButton.toggle()
                            self.isModal = true
                        }
                )
            }
            
        }.gesture(
            TapGesture()
                .onEnded{ _ in
                    withAnimation {
                        self.showSetteingButton.toggle()
                    }
                }
        )

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var rootState = Root()
    static var previews: some View {
        ContentView()
        .environmentObject(rootState)
    }
}
