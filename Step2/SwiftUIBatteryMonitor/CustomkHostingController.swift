//
//  CustomkHostingController.swift
//  SwiftUIBatteryMonitor
//
//  Created by 能登 要 on 2019/09/07.
//  Copyright © 2019 能登 要. All rights reserved.
//

import SwiftUI

class CustomkHostingController<Content> : UIHostingController<Content> where Content : View {
    @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
