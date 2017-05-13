//
//  ViewController.swift
//  UITableViewCell
//
//  Created by Cntt22 on 4/22/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import Foundation
import UIKit

class Event
{
    var nameevent: String     //Name of event
    var detail   : String     //Detail of event

    //Một sự kiện chuẩn: gồm tên và chi tiết
    init(nameevent: String, detail: String)
    {
        self.nameevent = nameevent
        self.detail = detail
    }
}
