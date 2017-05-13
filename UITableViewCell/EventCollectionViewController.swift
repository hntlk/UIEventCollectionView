//
//  EventCollectionViewController.swift
//  UITableViewCell
//
//  Created by Cntt22 on 5/10/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class EventCollectionViewController: UICollectionViewController {
    @IBOutlet weak var lb_day: UILabel!
    // Data Source
    lazy var eventLines: [EventLine] = {
        return EventLine.eventLines()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        super.viewDidLoad()
        title = "Management Events ZWART_hnt"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
                return eventLines.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        // #warning Incomplete implementation, return the number of rows
        let eventLine = eventLines[section]
        return eventLine.events.count
    }

    //Set nội dung cho Collection ReuableView (tiêu đề mỗi section)
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EventReuseCell", for: indexPath) as! EventCollectionReusableView
        
        let dayInWeek = eventLines[indexPath.section]
        reuseCell.configureReuseCell(day: dayInWeek.day)
        
        return reuseCell
    }
    
    //Set nội jdung cho mỗi cell item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventViewCell
        
        let eventList = eventLines[indexPath.section].events
        cell.configureCell(event: eventList[indexPath.row])
        
        return cell
    }
    //Bắt sự kiện click chọn 1 item
    //override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let alert = UIAlertController(title: "Action?", message: nil, preferredStyle: .alert)
        //Set action khi click Delete
        //let alertActionDelete = UIAlertAction(title: "Delete", style: .default, handler: {
            //(action: UIAlertAction!) -> Void in
            
            ///let eventList = self.eventLines[indexPath.section]
            //eventList.events.remove(at: indexPath.row)
            //self.collectionView?.deleteItems(at: [indexPath])
        //})
        //Set action khi click Edit
        //let alertActionEdit = UIAlertAction(title: "Edit", style: .default, handler: {
            //(action: UIAlertAction!) -> Void in
            
            //let editVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: //"EventDetailController") as! EventDetailController
            
            //editVC.daysInWeek = self.daysInWeek
           // editVC.indexPath = indexPath
            
           // self.navigationController?.pushViewController(editVC, animated: true)
        //})
        
       // let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Thêm các alertAction vào alert
        //alert.addAction(alertActionDelete)
        //alert.addAction(alertActionEdit)
        //alert.addAction(alertActionCancel)
        
        //self.present(alert, animated: true, completion: nil)
    //}
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    // Kiểm tra các segue và đẩy dữ liệu tương ứng
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Show View Detail
            if segue.identifier == "ShowDetail" {
                let editVC = segue.destination as! ViewController
                //Lấy dữ liệu từ cell đươc chon
                let cell = sender as! EventViewCell
                let indexPath = collectionView?.indexPath(for: cell)
                //Set dữ liệu cho view detail
                let dayInWeek = eventLines[(indexPath?.section)!]
                let event = dayInWeek.events[(indexPath?.row)!]
                editVC.event=event
                editVC.dayinw = dayInWeek.day
                //editVC.eventShow = eventLines
                //editVC.indexPath = indexPath!
            }
            
            //Kiểm tra view Add new được show lên
            if segue.identifier == "ShowAddNew" {
                let addNewVC = segue.destination as! EventAddController
                
                addNewVC.eventAdd = eventLines
            }

        }
    }
    
