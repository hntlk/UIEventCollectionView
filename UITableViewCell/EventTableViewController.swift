//
//  EventTableViewController.swift
//  UITableViewCell
//
//  Created by Cntt22 on 4/22/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    // Data Source
    lazy var eventLines: [EventLine] = {
        return EventLine.eventLines()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Management Events ZWART_hnt"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //Load lại dữ liệu khi show View
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return eventLines.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let eventLine = eventLines[section]
        return eventLine.events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell

        let eventLine = eventLines[indexPath.section]   
        let event = eventLine.events[indexPath.row]     
        
        // Transfer data into Cell
        cell.Name?.text = event.nameevent
        cell.Description?.text = event.detail
        
        return cell
        // Configure the cell...
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let eventLine = eventLines[section]
        return eventLine.day
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // Proccessing while user remove an event
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let eventLine = eventLines[indexPath.section]
            eventLine.events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }



    // Proccessing when user move an event (sort)
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let eventLine1 = eventLines[fromIndexPath.section]
        let eventLine2 = eventLines[toIndexPath.section]
        let event = eventLine1.events[fromIndexPath.row]
        eventLine1.events.remove(at: fromIndexPath.row)
        eventLine2.events.insert(event, at: toIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if let identifier = segue.identifier {
            switch identifier {
            case "showDetail":
                let eventDetailVC = segue.destination as! ViewController
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    eventDetailVC.event = eventAtIndexPath(indexPath: indexPath as NSIndexPath)
                    eventDetailVC.DayOfWeekViewControll = dayAtIndexPath(indexPath: indexPath as NSIndexPath)
                }
             case "AddNew":
                let addNewVC = segue.destination as! EventAddController
                addNewVC.eventAdd = eventLines
                //break
                
            default:
                break
            }
        }
       // let destinationVC = segue.destination as! ViewController
       // destinationVC.DayOfWeekViewControll = DayOfWeek
        //destinationVC.NameEventViewControll = NameOfEvent
       // destinationVC.DetailViewControll = DetailOfEvent
    }
    // MARK: - Helper Method
    
    func eventAtIndexPath(indexPath: NSIndexPath) -> Event
    {
        let eventLine = eventLines[indexPath.section]
        return eventLine.events[indexPath.row]
    }
    
    func dayAtIndexPath(indexPath: NSIndexPath) -> String
    {
        let eventLine = eventLines[indexPath.section]
        return eventLine.day
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
