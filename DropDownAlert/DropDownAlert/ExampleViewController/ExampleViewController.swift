//
//  ExampleViewController.swift
//  DropDownAlert
//
//  Created by Cauê Silva on 06/06/17.
//  Copyright © 2017 Caue Alves. All rights reserved.
//

import Foundation
import UIKit

// MARK: Enum for button pressed

enum ButtonPressed: Int {
    case success
    case custom
    case fail
}

class ExampleViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet var showDropDownAlertButtons: [UIButton]!
    
    // MARK: VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showDropDownAlert(message: "Hello message", success: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        DropDownAlertPresenter.dismiss()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: Components setup
    
    private func setupButtons() {
        let buttonAttributes: [(title: String, color: UIColor)] = [("Success", UIColor.successDropDownAlertColor()),
                                                                   ("Custom", UIColor(red: 239/255, green: 91/255, blue: 48/255, alpha: 1.0)),
                                                                   ("Fail", UIColor.failDropDownAlertColor())]
        
        for (index, button) in showDropDownAlertButtons.enumerated() {
            button.layer.cornerRadius = 4
            button.setTitle(buttonAttributes[index].title, for: .normal)
            button.setTitle(buttonAttributes[index].title, for: .highlighted)
            button.setTitleColor(.white, for: .normal)
            button.setTitleColor(.white, for: .highlighted)
            button.backgroundColor = buttonAttributes[index].color
            button.tag = index
        }
    }
    
    private func setupTextField() {
        messageTextField.placeholder = "Enter a custom message for alert"
        messageTextField.clearButtonMode = .whileEditing
    }
    
    // MARK: Action
    
    @IBAction func showDropDownAlertButtonPressed(_ sender: UIButton) {
        guard let buttonPressed = ButtonPressed(rawValue: sender.tag), let inputedMessage = messageTextField.text else {
            return
        }
        
        let message = inputedMessage.isEmpty ? "Input a message\nnext time" : inputedMessage
        
        switch buttonPressed {
        case .success:
            DropDownAlertPresenter.show(with: DefaultDropDownAlertLayout(message: message, success: true))
        case .custom:
            DropDownAlertPresenter.show(with: ExampleCustomAlertLayout(message: message))
        case .fail:
            DropDownAlertPresenter.show(with: DefaultDropDownAlertLayout(message: message, success: false))
        }
    }
    
}

// MARK: Custom alert layout example

struct ExampleCustomAlertLayout: DropDownAlertLayout {
    private var message = ""
    
    init(message: String) {
        self.message = message
    }
    
    var layoutDTO: DropDownAlertViewDTO {
        return DropDownAlertViewDTO(image: UIImage(named: "customDropDownAlertIcon") ?? UIImage(),
                                    message: message,
                                    messageColor: .white,
                                    backgroundColor: UIColor(red: 239/255, green: 91/255, blue: 48/255, alpha: 1.0),
                                    visibleTime: 5)
    }
}

// MARK: Show DropDownAlet using an extension

extension UIViewController {
    func showDropDownAlert(message: String, success: Bool) {
        DropDownAlertPresenter.show(with: DefaultDropDownAlertLayout(message: message, success: success))
    }
}
