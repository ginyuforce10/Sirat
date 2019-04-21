//
//  PostCell.swift
//  froot-loops
//
//  Created by Rageeb Mahtab on 4/21/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var speakerName: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
