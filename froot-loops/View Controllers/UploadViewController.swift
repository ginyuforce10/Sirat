//
//  UploadViewController.swift
//  froot-loops
//
//  Created by Rageeb Mahtab on 4/21/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {

    @IBOutlet weak var flyerImageView: UIImageView!
    
    @IBOutlet weak var eventText: UITextField!
    
    @IBOutlet weak var speakerText: UITextField!
    
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    
    @IBOutlet weak var toDatePicker: UIDatePicker!
    
    @IBOutlet weak var locationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func uploadPost(_ sender: Any) {
        //Todo
        // Post the data to firebase
        // Segue the controller to the Table View Controller
        prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
        
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
