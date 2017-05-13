//
//  ViewController.swift
//  UITableViewCell
//
//  Created by Cntt22 on 4/22/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var NameEvent: UILabel!
    @IBOutlet weak var Detail: UILabel!
    @IBOutlet weak var Day: UILabel!
    var event: Event?
    var dayinw = String()
    //var eventShow: [EventLine]?
    //var indexPath: IndexPath?
    var DayOfWeekViewControll = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NameEvent.text = event?.nameevent
        //Detail.text = event?.detail
        //Day.text = DayOfWeekViewControll
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData() {
        Day.text = dayinw

         
        NameEvent.text = event?.nameevent

        Detail.text = event?.detail
    }
}

