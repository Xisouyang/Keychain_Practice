//
//  ViewController.swift
//  KeychainPractice
//
//  Created by Stephen Ouyang on 4/10/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    let keychain = KeychainSwift()
    
    let saveLabel = UILabel(frame: .zero)
    let msgDescLabel = UILabel(frame: .zero)
    let currMsgLabel = UILabel(frame: .zero)
    let syncLabel = UILabel(frame: .zero)
    var textField = UITextField(frame: .zero)
    let saveButton = UIButton(frame: .zero)
    let deleteButton = UIButton(frame: .zero)
    var keychainSwitch = UISwitch(frame: .zero)
    var keychainContainer = UIView(frame: .zero)
    let horizontalStack = UIStackView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(saveLabel)
        view.addSubview(msgDescLabel)
        view.addSubview(currMsgLabel)
        view.addSubview(textField)
        view.addSubview(saveButton)
        view.addSubview(deleteButton)
        view.addSubview(horizontalStack)
        
        UIConstraints()
        configUI()
        
        currMsgLabel.text = keychain.get("msgKey")
    }
    
    @objc func saveTapped() {
        if let unwrappedText = textField.text {
            keychain.set(unwrappedText, forKey: "msgKey")
            currMsgLabel.text = unwrappedText
        }
        
        if keychainSwitch.isOn {
            keychain.synchronizable = true
        } else {
            keychain.synchronizable = false
        }
    }
    
    @objc func deleteTapped() {
        keychain.delete("msgKey")
        currMsgLabel.text = ""
    }
}

// MARK: Constraints
extension ViewController {
    
    func UIConstraints() {
        labelConstraints()
        textFieldConstraints()
        buttonConstraints()
        stackConstraints()
    }
    
    func labelConstraints() {
        
        saveLabel.translatesAutoresizingMaskIntoConstraints = false
        saveLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        saveLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        saveLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 3).isActive = true
        
        msgDescLabel.translatesAutoresizingMaskIntoConstraints = false
        msgDescLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        msgDescLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        msgDescLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        msgDescLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 60).isActive = true
        
        currMsgLabel.translatesAutoresizingMaskIntoConstraints = false
        currMsgLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        currMsgLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        currMsgLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currMsgLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 70).isActive = true
    }
    
    func textFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 100).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 18).isActive = true
    }
    
    func buttonConstraints() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        saveButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 35).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        deleteButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 85).isActive = true
        deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func stackConstraints() {
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.heightAnchor.constraint(equalToConstant: 150).isActive = true
        horizontalStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        horizontalStack.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 45).isActive = true
        horizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func switchConstraints() {
        keychainSwitch.translatesAutoresizingMaskIntoConstraints = false
        keychainSwitch.widthAnchor.constraint(equalToConstant: 50).isActive = true
        keychainSwitch.heightAnchor.constraint(equalToConstant: 50).isActive = true
       keychainSwitch.rightAnchor.constraint(equalTo: keychainContainer.rightAnchor, constant: -7).isActive = true
        keychainSwitch.topAnchor.constraint(equalToSystemSpacingBelow: keychainContainer.topAnchor, multiplier: 7.5).isActive = true
    }
}

// MARK: UI
extension ViewController {
    
    func configUI() {
        setSaveLabel()
        setMsgLabel()
        setSyncLabel()
        configSaveButton()
        configDeleteButton()
        configTextField()
        configStack()
        configContainer()
    }
    
    func configTextField() {
        textField.placeholder = "message goes here"
        textField.textAlignment = .center
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 6
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setSaveLabel() {
        saveLabel.text = "Save a Message"
        saveLabel.textAlignment = .center
    }
    
    func setMsgLabel() {
        msgDescLabel.text = "The current message is:"
        msgDescLabel.textAlignment = .center
        
        currMsgLabel.text = "..."
        currMsgLabel.textAlignment = .center
        currMsgLabel.sizeToFit()
        currMsgLabel.numberOfLines = 0
        currMsgLabel.lineBreakMode = .byWordWrapping
    }
    
    func setSyncLabel() {
        syncLabel.text = "Will it sync with iCloud?"
        syncLabel.textAlignment = .center
    }
    
    func configSaveButton() {
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1.0), for: .normal)
        saveButton.setTitleColor(UIColor(red: 39/255, green: 139/255, blue: 34/255, alpha: 1.0), for: .highlighted)
    }
    
    func configDeleteButton() {
        deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(UIColor(red: 1, green: 59/255, blue: 48/255, alpha: 1), for: .normal)
        deleteButton.setTitleColor(UIColor(red: 139/255, green: 0, blue: 0, alpha: 1.0), for: .highlighted)
    }
    
    func configContainer() {
        keychainContainer.addSubview(keychainSwitch)
        keychainContainer.isUserInteractionEnabled = true
        switchConstraints()
    }
    
    func configStack() {
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fill
        horizontalStack.addArrangedSubview(syncLabel)
        horizontalStack.addArrangedSubview(keychainContainer)
    }
}

