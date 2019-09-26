//
//  Root.swift
//  SwiftUIBatteryMonitor
//
//  Created by 能登 要 on 2019/09/26.
//  Copyright © 2019 能登 要. All rights reserved.
//

import SwiftUI

class Root : ObservableObject
{
    @Published var batteries: [Battery]
    
    init() {
        let textColor = Color.white
        let gradStarColor = Color("GradStartColor")
        let gradEndColor = Color("GradEndColor")
        
        batteries = [
                      Battery(level: "97",
                              state: "",
                              deviceName: "",
                              backgroundColors:[gradStarColor,gradEndColor],
                              textColor: textColor),
                      Battery(level: "100",
                              state: "Full",
                              deviceName: "iPhone 7",
                              backgroundColors: [gradStarColor,gradEndColor],
                              textColor: textColor),
                      Battery(level: "86",
                              state: "Unplugged",
                              deviceName: "iPhone 6s",
                              backgroundColors: [gradStarColor,gradEndColor],
                              textColor: textColor),
                      Battery(level: "100",
                              state: "Charging",
                              deviceName: "iPhone 8",
                              backgroundColors: [gradStarColor,gradEndColor],
                              textColor: textColor)
                    ]
    }
}
