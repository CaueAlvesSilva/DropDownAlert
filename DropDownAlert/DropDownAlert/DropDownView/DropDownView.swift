//
//  DropDownView.swift
//  DropDownAlert
//
//  Created by Cauê Silva on 06/06/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import UIKit
protocol Bla {
    func teste()
}

class DropDownView: UIView {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    private var timer: Timer?
    private var visibleTime: TimeInterval = 4.0
    private var animationDuration: TimeInterval = 0.8
    private var animationDelay: TimeInterval = 0
    private var springDamping: CGFloat = 0.9
    private var springVelocity: CGFloat = 0.2
    var alertHeight: CGFloat {
        return frame.height
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setAccessibilityIDs()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.stopAnimation)))
    }
    
    private func setAccessibilityIDs() {
        accessibilityIdentifier = "DropDownAlert.view"
        messageLabel.accessibilityIdentifier = "DropDownAlert.alertImageView"
        iconImageView.accessibilityIdentifier = "DropDownAlert.alertMessageLabel"
    }
    
    func startAnimation(alertDTO: DropDownAlertLayout) {
        let dto = alertDTO.layoutDTO
        backgroundColor = dto.backgroundColor
        messageLabel.text = dto.message
        messageLabel.textColor = dto.messageColor
        iconImageView.image = dto.image
        iconImageView.tintColor = dto.messageColor
        self.visibleTime = dto.visibleTime
        startAnimation()
    }
    
    private func startAnimation() {
        print("# \(self.classForCoder): \(#function)")
        DispatchQueue.main.safeAsync {
            self.setAlertPosition(shouldDisplay: false)
            UIView.animate(withDuration: self.animationDuration,
                           delay: self.animationDelay,
                           usingSpringWithDamping: self.springDamping,
                           initialSpringVelocity: self.springVelocity,
                           options: [],
                           animations: {
                            self.setAlertPosition(shouldDisplay: true) }, completion: nil)
            self.timer = Timer.scheduledTimer(timeInterval: self.visibleTime, target: self, selector: #selector(self.stopAnimation), userInfo: nil, repeats: false)
        }
    }
    
    func stopAnimation() {
        print("# \(self.classForCoder): \(#function)")
        timer?.invalidate()
        DispatchQueue.main.safeAsync {
            UIView.animate(withDuration: self.animationDuration, animations: {
                self.setAlertPosition(shouldDisplay: false)
            }, completion: { _ in
                DispatchQueue.main.safeAsync {
                    self.removeFromSuperview()
                }
            })
        }
    }
    
    private func setAlertPosition(shouldDisplay: Bool) {
        var frame = self.frame
        frame.origin.y = shouldDisplay ? 0 : -self.frame.size.width
        self.frame = frame
    }
    
}
