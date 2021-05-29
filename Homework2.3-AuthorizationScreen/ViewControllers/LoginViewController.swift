//
//  ViewController.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 24.05.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private var registratedUserName = "User"
    private var registratedPassword = "Password"
    
    // MARK: IBActions
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(registratedUserName) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(registratedPassword) 😉")
    }
    
    // MARK: - Private Methods
    @IBAction func logInButtonPressed() {
        if loginTextField.text != registratedUserName || passwordTextField.text != registratedPassword {
            showAlert(
                title: "Incorrect login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
    }
    
    // MARK: - View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .gray.withAlphaComponent(0.8)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeUserName = registratedUserName
    }
    

    
}

// MARK: - Private Methods

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "goToWelcomeView", sender: nil)
        }
        return true
    }
}
