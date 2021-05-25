//
//  ViewController.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 24.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    private var registratedUserName = "User"
    
    private var registratedPassword = "Password"
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = .gray.withAlphaComponent(0.8)
        
        loginTextField.keyboardType = UIKeyboardType.default
        loginTextField.autocorrectionType = .no
        //loginTextField.clearsOnBeginEditing = true
        //loginTextField.layer.cornerRadius = 5
        
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        
        
    }

    private func checkAuthData() -> Bool {
        
        print("regName: \(registratedUserName.hash.hashValue) - regPass: \(registratedPassword.hash.hashValue)")
        print("logName: \(loginTextField.text.hashValue) - logPass: \(passwordTextField.text.hashValue)")
        print("regName: \(registratedUserName.hashValue) - regPass: \(registratedPassword.hashValue)")
        print("logName: \(loginTextField.text.hashValue) - logPass: \(passwordTextField.text.hashValue)")
        
        if registratedUserName.hashValue == loginTextField.text.hashValue && registratedPassword.hashValue == passwordTextField.text.hashValue {
            return true
        } else if registratedUserName.hashValue == loginTextField.text?.hashValue && registratedPassword.hashValue != passwordTextField.text?.hashValue {
            print("Incorrect password")
            return false
        } else {
            print("Unnnown user")
            return false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        
        welcomeVC.welcomeUserName = loginTextField.text ?? "friend"
        checkAuthData()
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        loginTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    
}

