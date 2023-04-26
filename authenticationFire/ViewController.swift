//
//  ViewController.swift
//  authenticationFire
//
//  Created by Mohan K on 07/04/23.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var siginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signButton: UIButton!
    
    var isSigIn:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LogInsegment(_ sender: Any) {
        isSigIn = !isSigIn
        if isSigIn {
            siginLabel.text = "Sign In"
            signButton.setTitle("Sign In", for: .normal)
        }
        else {
            siginLabel.text = "Register"
            signButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func emailTxtField(_ sender: Any) {
    }
    
    @IBAction func passwordTxtField(_ sender: Any) {
    }
    
    @IBAction func logBtn(_ sender: UIButton) {
        
        if let email = emailTextField.text , let pass = passwordTextField.text {
            
            if isSigIn {
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user {
                        self.performSegue(withIdentifier: "gotoHome", sender: self)
                    }
                    else {
                        
                    }
                })
                emailTextField.text = ""
                passwordTextField.text = ""
            }
            else
            {
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    
                    if let u = user {
                        self.performSegue(withIdentifier: "gotoHome", sender: self)
                    }
                    else {
                        
                    }
                })
            }
            emailTextField.text = ""
            passwordTextField.text = ""
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}
