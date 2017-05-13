//
//  EventAddController.swift
//  UITableViewCell
//
//  Created by Cntt22 on 5/10/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class EventAddController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let dayList = ["Monday", "Tuesday", "Wednessday", "Thursday", "Friday", "Saturday", "Sunday"]
    var eventAdd: [EventLine]?
    
    @IBOutlet weak var dayPicked: UIPickerView!
     @IBOutlet weak var eventDetail: UITextView!
    
    @IBOutlet weak var addNew: UIButton!
    @IBOutlet weak var eventName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dayPicked.delegate = self
        self.dayPicked.dataSource = self
       
        
        //Set thứ hiên tại lên pickerView
        setDayEvent()
        // Do any additional setup after loading the view.
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //Số components của PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Số hàng trong 1 component của PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    
    //Tiêu đề (Nội dung) cho mỗi row trong componenet
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dayList[row]
    }
    
    //Event Add button
    @IBAction func btn_Add_Click(_ sender: UIButton) {
        let dayInWeek = eventAdd?[dayPicked.selectedRow(inComponent: 0)]
        
        dayInWeek?.events.append(Event(nameevent: self.eventName.text!, detail:  self.eventDetail.text!))
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    //Kiểm tra thứ của ngày hiện tại
    func getCurrenntDay() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: currentDate)
        var month = calendar.component(.month, from: currentDate)
        var year = calendar.component(.year, from: currentDate)
        
        if month < 3 {
            month += 12
            year -= 1
        }
        
        return (abs(day + 2 * month + 3 * (month + 1) / 5 + year + year / 4) % 7)
    }
    
    func setDayEvent() {
        let numberOfDay = getCurrenntDay()
        
        switch numberOfDay {
        case 1:
            dayPicked.selectRow(0, inComponent: 0, animated: true)
        case 2:
            dayPicked.selectRow(1, inComponent: 0, animated: true)
        case 3:
            dayPicked.selectRow(2, inComponent: 0, animated: true)
        case 4:
            dayPicked.selectRow(3, inComponent: 0, animated: true)
        case 5:
            dayPicked.selectRow(4, inComponent: 0, animated: true)
        case 6:
            dayPicked.selectRow(5, inComponent: 0, animated: true)
        default:
            dayPicked.selectRow(6, inComponent: 0, animated: true)
        }
    }


}
