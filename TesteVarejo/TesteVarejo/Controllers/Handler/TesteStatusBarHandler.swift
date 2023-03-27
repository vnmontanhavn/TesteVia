//
//  TesteStatusBarHandler.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        let tag = 38482
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        if let statusBar = keyWindow?.viewWithTag(tag) {
            return statusBar
        } else {
            guard let statusBarFrame = keyWindow?.windowScene?.statusBarManager?.statusBarFrame else { return nil }
            let statusBarView = UIView(frame: statusBarFrame)
            statusBarView.tag = tag
            keyWindow?.addSubview(statusBarView)
            return statusBarView
        }
    }
}
