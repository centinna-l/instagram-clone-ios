//
//  ViewController.swift
//  InstaClone
//
//  Created by Jerry Joy on 2024-01-03.
//

import UIKit
import Firebase
import FirebaseCore

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signIn.setTitle("Sign In", for: .normal)
        login.setTitle("Login", for: .normal)
    }


    @IBAction func signInPressed(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text! ){
                ( authData, error) in
                if error != nil {
                    self.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Email/Password is missing!")
        }
       
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    func makeAlert(title: String, message: String  ){
        let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present( alert, animated: true, completion: nil)
    }
}

