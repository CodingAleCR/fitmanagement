//
//  ViewController.swift
//  Fit Management
//
//  Created by Alejandro Ulate Fallas  on 12/28/18.
//  Copyright © 2018 Alejandro Ulate Fallas . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        if (usernameTextField.text!.isEmpty
            || passwordTextField.text!.isEmpty) {
            let alert = UIAlertController(title: "Campos Requeridos", message: "Es necesario llenar los campos de usuario y contraseña para continuar.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                alert.dismiss(animated: true, completion: {})
            }))
            self.present(alert, animated: true, completion: {})
        } else {
            performSegue(withIdentifier: "loginToWorkouts", sender: nil)
        }
    }
    
}

