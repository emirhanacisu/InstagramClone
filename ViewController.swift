//
//  ViewController.swift
//  InstagramClone
//
//  Created by Erhan Acisu on 28.09.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit
import  Firebase


class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error" )
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
        }
        else{
            makeAlert(titleInput: "Error", messageInput: "ID PW boş geçilemez")
        }
    }
    @IBAction func signupClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error" )
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
    
        }
        else {
            
            makeAlert(titleInput: "OK", messageInput: "Boş Bırakılamaz")
        }
    }
        
    func makeAlert(titleInput : String, messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton =   UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

