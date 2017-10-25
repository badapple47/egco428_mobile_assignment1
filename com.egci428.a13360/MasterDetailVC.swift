//
//  MasterDetailVC.swift
//  com.egci428.a13360
//
//  Created by Pathompong Chaisri on 10/12/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit

class MasterDetailVC: UITableViewController {
    

    var meaning: String! = ""
    var message: String! = ""
    var date: String! = ""
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        
        let aWishmore = aWish(meaning:meaning,message:message,date:date)
        allyourWish.append(aWishmore)
        tableView.reloadData()
        
    
        
        
    }
    
    
    @IBOutlet weak var goMakeAWish: UIBarButtonItem!
    
    struct aWish {
        var meaning: String
        var message: String
        var date : String
        
    }
    
  
    var allyourWish: [aWish] = []
    
    
    
    var aWish1 = aWish(meaning:"positive",message:"You're Lucky",date:"10/11/2016, 12:00PM")
        var aWish2 = aWish(meaning:"positive",message:"You will get A",date:"10/11/2016, 13:00PM")
        var aWish3 = aWish(meaning:"negative",message:"Don't Panic",date:"10/11/2016, 14:00PM")
    
 
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        self.navigationItem.backBarButtonItem?.title = "NewName";

        allyourWish.append(aWish1)
        allyourWish.append(aWish2)
        allyourWish.append(aWish3)
        
      
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return allyourWish.count
//            return 3
            //return จน.ของแถวใน section
        }else{
            return 0

        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

//        tableView.reloadData()
        
            let thiswish = allyourWish[indexPath.row]

            cell.textLabel?.text = thiswish.message
            cell.imageView?.image = UIImage(named : "opened_cookie.png")
            cell.detailTextLabel?.text = thiswish.date
        
        
        if thiswish.meaning=="positive" {
            cell.textLabel?.textColor = UIColor.blue
        }
        else {
            cell.textLabel?.textColor = UIColor.orange
        }
        
        
     

       return cell
    }


    //พิม heightForFooterInSection อย่าลืม override func ข้างหน้า
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1

    }
    //พิม heightForHeaderInSection อย่าลืม override func ข้างหน้า
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }



    
    
    
}



