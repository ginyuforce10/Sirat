//
//  LoginViewController.swift
//  froot-loops
//
//  Created by Rageeb Mahtab on 4/18/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var emailOu: UITextField!
    @IBOutlet weak var passwordOu: UITextField!
    
    // Constants
    let userDefault = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userDefault.bool(forKey: "usersignedin") {
            performSegue(withIdentifier: "Segue_To_Signin", sender: self)
        }
    }
    
    
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { ( result, error) in
            if error == nil {
                // User created
                print("User Created")
                // Sign in user
                self.signInUser(email: email, password: password)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func signInUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                // Signed in
                print("User Signed In")
                self.userDefault.set(true, forKey: "usersignedin")
                self.userDefault.synchronize()
                self.performSegue(withIdentifier: "Segue_To_Signin", sender: self)
            } else if (error?._code == AuthErrorCode.userNotFound.rawValue) {
                self.createUser(email: email, password: password)
            } else {
             print(error?.localizedDescription)
            }
        }
    }
    
//    func signUpUser(email: String, password: String) {
//        createUser(email:email, password: password)
//        print("User Signed Up")
////        self.userDefault.set(true, forKey: "usersignedin")
////        self.userDefault.synchronize()
////        self.performSegue(withIdentifier: "Segue_To_Signin", sender: self)
//
//    }
//        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in if (error?._code == AuthErrorCode.userNotFound.rawValue) {
//                self.createUser(email: email, password: password)
//            print("User Signed In")
//            self.userDefault.set(true, forKey: "usersignedin")
//            self.userDefault.synchronize()
//            self.performSegue(withIdentifier: "Segue_To_Signin", sender: self)
//        } else {
//            print(error?.localizedDescription)
//        }
        
//        }
//        self.createUser(email: email, password: password)
//    }
//
    
    
    
    // Actions
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        signInUser(email: emailOu.text!, password: passwordOu.text!)
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
