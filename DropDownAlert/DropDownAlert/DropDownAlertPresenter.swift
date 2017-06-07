//
//  DropDownAlertPresenter.swift
//  DropDownAlert
//
//  Created by Cauê Silva on 07/06/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

class DropDownAlertPresenter {
    class func show(with layout: DropDownAlertLayout) {
        let viewController = UIApplication.topViewController()
        let window = UIApplication.shared.keyWindow
        
        let alert: DropDownView = UIView.fromNib()
        alert.frame = CGRect(x: 0, y: 0, width: viewController.view.frame.size.width, height: alert.alertHeight)
        
        window?.addSubview(alert)
        window?.bringSubview(toFront: alert)
        
        alert.startAnimation(alertDTO: layout)
    }
    
    class func dismiss() {
        let window = UIApplication.shared.keyWindow
        window?.subviews.forEach { view in
            if let alertView = view as? DropDownView, view.isKind(of: DropDownView.self) {
                alertView.stopAnimation()
                return
            }
        }
    }
}
