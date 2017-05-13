//
//  EventCollectionReusableView.swift
//  UITableViewCell
//
//  Created by Cntt22 on 5/10/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class EventCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var lb_day: UILabel!
    public func configureReuseCell(day: String) {
        self.lb_day.text = day
    }
}
