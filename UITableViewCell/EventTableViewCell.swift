//
//  EventTableViewCell.swift
//  UITableViewCell
//
//  Created by Cntt22 on 4/22/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell{

    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Description: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Table view data source
    
    
    
}
