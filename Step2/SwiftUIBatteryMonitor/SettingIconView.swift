//
//  SettingIconView.swift
//  SwiftUIBatteryMonitor
//
//  Created by 能登 要 on 2019/09/21.
//  Copyright © 2019 能登 要. All rights reserved.
//

import SwiftUI

struct SettingIconView: View {
    var foregroundColor: Color
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                Spacer()
                Image(systemName: "gear")
                    .renderingMode(.template)
                    .foregroundColor(self.foregroundColor)
                    .font(.largeTitle)
                    .padding(.top, 17)
                    .padding(.trailing, 17)
            }
            Spacer()
        }
    }
}

struct SettingIconView_Previews: PreviewProvider {
    static var previews: some View {
        SettingIconView( foregroundColor: Color.white )
    }
}
