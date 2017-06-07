//
//  UIView+Extensions.swift
//  DropDownAlert
//
//  Created by Cauê Silva on 07/06/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)!.first as! T
    }
}
