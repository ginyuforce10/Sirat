//
//  HomeViewController.swift
//  froot-loops
//
//  Created by Rageeb Mahtab on 4/18/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var scSegment: UISegmentedControl!
    @IBOutlet weak var emailOu: UILabel!
    
    // Constants
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let email = Auth.auth().currentUser?.email else { return }
        emailOu.text = email
        // Do any additional setup after loading the view.
    }

    @IBAction func onSegmentSwitched(_ sender: Any) {
        let getIndex = scSegment.selectedSegmentIndex
        switch (getIndex) {
        case 0:
            UIView.animate(withDuration: 0.5, animations: {
                self.tableView.alpha = 1
                self.mapView.alpha = 0
            })
        case 1:
            UIView.animate(withDuration: 0.5, animations: {
                self.tableView.alpha = 0
                self.mapView.alpha = 1
            })
        default:
            UIView.animate(withDuration: 0.5, animations: {
            self.tableView.alpha = 1
            self.mapView.alpha = 0
            })
        }
    }
    
    @IBAction func signOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            try GIDSignIn.sharedInstance()?.signOut()
//            self.userDefault.set(false, forKey: "usersignedin")
            userDefault.removeObject(forKey: "usersignedin")
            userDefault.synchronize()
            self.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
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
