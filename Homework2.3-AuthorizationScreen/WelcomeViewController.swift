//
//  WelcomeViewController.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 25.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    var welcomeUserName = ""
    
    
    // MARK: - IBOutlets
    @IBOutlet var welcomeView: UIView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, dear \(welcomeUserName)!"
        
    }
    
    // MARK: - IBActions
    
    @IBAction func tappedLogoutButton(_ sender: UIButton!) {
        dismiss(animated: true)
        welcomeUserName = ""
    }
    

    
}
