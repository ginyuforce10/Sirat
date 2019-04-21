//
//  SponsorsViewController.swift
//  froot-loops
//
//  Created by Rageeb Mahtab on 4/18/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class SponsorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    let images = ["Masjid-Al-Aman", "furqan", "haqq", "syria", "orphan"]
    
    let proName = ["Iftar at Al Aman Masjid","Iftar at Al-Furqan Masjid", "Fund Masjid Al-Haqq Construction", "Syria Refugee: Food For the Hungry", "Donate to Help Raise Orphan"]
    let raised = ["$1000","$2500","$5000", "$25000", "$4000"]
    let goal = ["$2,000","$5,000","$10,000", "$50000", "$8000"]
    let pdescription = ["Our Iftar event is happening this weekend at Al-Alam Masjid. We expect to have more than 100 people attend the event. Everyone is encouraged to come to the event.","Our Iftar event is happening this weekend at Al-Furqan Masjid. We expect to have more than 300 people attend the event. Everyone is encouraged to come to the event.","We have been trying to raise money for Masjid Al-Haqq. We have about three months to raise $10,000. Every please try to donate to the best of your ability. Thank you!", "Half of Syria’s pre-war population has either died or fled. Half of them are children. They live in tents or dilapidated buildings and are desperate for food, shelter, water and other necessities. Food for the Hungry is providing life-saving supplies in refugee camps in Jordan.", "Orphan Family Support means you help uplift an orphan and his or her family into self-reliance and independence by giving them the tools they need to thrive! Join the thousands of dedicated, caring humanitarians who are caring for orphans today!"]
    
    
    
    
        
        
        
        
        // Do any additional setup after loading the view.
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorViewCell") as! SponsorViewCell
        
        let projectN = proName[indexPath.row] as! String
        let pRaised = raised[indexPath.row] as! String
        let pGoal = goal[indexPath.row] as! String
        let proDescription = pdescription[indexPath.row] as! String
        
        cell.nameLabel.text = projectN
        cell.raisedLabel.text = pRaised
        cell.goalLabel.text = pGoal
        cell.descriptionLabel.text = proDescription
        cell.posterView.image = UIImage(named: images[indexPath.row])
        
        cell.backgroundColor = tableView.backgroundColor
        cell.contentView.backgroundColor = tableView.backgroundColor
        
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .clear
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
