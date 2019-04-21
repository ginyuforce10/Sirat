//
//  MyEventsViewController.swift
//  froot-loops
//
//  Created by Rageeb Mahtab on 4/18/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class MyEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let images = ["future1", "pastevent2", "future3", "upcoming event", "pastevent1"]
    
    let titles = ["Are You Ramadan Ready?", "Grand Iftaar", "Embracing Ramadan", "ICNA Convention", "Ordinary People"]
    
    let descriptions = ["Start off Ramadan on the right foot, and learn about all the ways to make the most of this Ramadan and leave Ramadan with a clean skate", "Join us for the iftaar of the century, where we rejoice the start of Ramadan and share his moment with keynote speakers such as Imam Siraj Wahhaj and more", "Want to learn how to make the most out of this Ramadan? Learn how to embrace it fully by covering the origins and history behind the significance of Ramadan", "Join us once again for our annual ICNA Convention where we hear from renowned speakers, listen to workshops and enjoy the infamous ICNA Bazaar", "Listen to the stories of how ordinary people were able to extraordinary things, and learn how we can implement these lessons into our own life"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Events", for: indexPath) as! MyEventsCells
            cell.EventView.image = UIImage(named: images[indexPath.row])
            cell.backgroundColor = tableView.backgroundColor
            cell.contentView.backgroundColor = tableView.backgroundColor
        
            cell.titleLabel.text = titles[indexPath.row]
            cell.descriptionLabel.text = descriptions[indexPath.row]

            return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100;//Choose your custom row height
    }

    

    @IBOutlet weak var profilePic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.layer.cornerRadius = profilePic.frame.size.width / 2
        profilePic.clipsToBounds = true
        
        tableView.dataSource = self
        tableView.delegate = self

        
        tableView.backgroundColor = .clear
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
       // let movie = movies[indexPath.row]
        
        let detailsViewController = segue.destination as! EventDetailViewController
        
        detailsViewController.etitle = titles[indexPath.row]
        detailsViewController.eimage = images[indexPath.row]
        detailsViewController.edescription = descriptions[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    


}
