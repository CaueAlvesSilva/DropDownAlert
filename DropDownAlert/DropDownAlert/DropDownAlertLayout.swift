//
//  DropDownAlertLayout.swift
//  DropDownAlert
//
//  Created by Cauê Silva on 07/06/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

protocol DropDownAlertLayout {
    var layoutDTO: DropDownAlertViewDTO { get }
}

struct DropDownAlertViewDTO: Equatable {
    var image = UIImage()
    var message = ""
    var messageColor = UIColor()
    var backgroundColor = UIColor()
    var visibleTime = TimeInterval(4.0)
    
    static func == (lhs: DropDownAlertViewDTO, rhs: DropDownAlertViewDTO) -> Bool {
        return  lhs.image == rhs.image &&
            lhs.message == rhs.message &&
            lhs.messageColor == rhs.messageColor &&
            lhs.backgroundColor == rhs.backgroundColor &&
            lhs.visibleTime == rhs.visibleTime
    }
}

struct DefaultDropDownAlert: DropDownAlertLayout {
    private var message = ""
    private var success = false
    
    init(message: String, success: Bool) {
        self.message = message
        self.success = success
    }
    
    var layoutDTO: DropDownAlertViewDTO {
        return DropDownAlertViewDTO(image: success ? UIImage.successDropDownAlertIcon() : UIImage.failDropDownAlertIcon(),
                                    message: message,
                                    messageColor: .white,
                                    backgroundColor: success ? UIColor.successDropDownAlertColor() : UIColor.failDropDownAlertColor(),
                                    visibleTime: 4.0)
    }
}
