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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        
        welcomeVC.welcomeUserName = loginTextField.text ?? "friend"
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        loginTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    
}

