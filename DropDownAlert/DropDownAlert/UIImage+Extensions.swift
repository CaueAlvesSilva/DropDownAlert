//
//  UIImage+Extensions.swift
//  DropDownAlert
//
//  Created by Cauê Silva on 06/06/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    class func successDropDownAlertIcon() -> UIImage {
        return UIImage(named: "successDropDownAlertIcon") ?? UIImage()
    }
    
    class func failDropDownAlertIcon() -> UIImage {
        return UIImage(named: "failDropDownAlertIcon") ?? UIImage()
    }
}
