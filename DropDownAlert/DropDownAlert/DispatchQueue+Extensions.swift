//
//  DispatchQueue+Extensions.swift
//  DropDownAlert
//
//  Created by Cauê Silva on 06/06/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

extension DispatchQueue {
    func safeAsync(_ block: @escaping () -> Void ) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            async { block() }
        }
    }
}
