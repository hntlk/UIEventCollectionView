//
//  EventViewCell.swift
//  UITableViewCell
//
//  Created by Cntt22 on 5/10/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class EventViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailEvent: UILabel!
    @IBOutlet weak var nameEvent: UILabel!
    public func configureCell(event: Event) {
        self.detailEvent.text = event.detail
        self.nameEvent.text = event.nameevent
    }
}
