//
//  ViewController.swift
//  FireMesStory
//
//  Created by formathead on 2019/11/04.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pwTxt: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signIn(_ sender: Any) {
        if emailTxt.text != nil && pwTxt.text != nil {
            Auth.auth().signIn(withEmail: emailTxt.text!, password: pwTxt.text!) { (result, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: "Could not signin Please Check your email & PW", preferredStyle: .actionSheet)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("Create Success Your Sign In")
                    
                    UserDefaults.standard.set(result!.user.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    
                    print(UserDefaults.standard.string(forKey: "user")!)
                    
                    let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    delegate.rememberUser()
                }
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Please Fill Out Your Email or PW", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func singUp(_ sender: Any) {
        if emailTxt.text != ""  && pwTxt.text != "" {
            Auth.auth().createUser(withEmail: emailTxt.text!, password: pwTxt.text!) { (result, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: "Please Check The Your Email or PW", preferredStyle: .actionSheet)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("Create Success Your Account")
                    
                    UserDefaults.standard.set(result?.user.email, forKey: "user")
                    UserDefaults.standard.synchronize()
                    
                    let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    delegate.rememberUser()
                }
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Please Fill Out Your Email or PW", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    

    
}//End Of The Class


