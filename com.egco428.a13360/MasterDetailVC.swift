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
    
    let cellReuseIdentifier = "cell"
    
    
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
    
    
    
    var aWish1 = aWish(meaning:"positive",message:"You're Lucky",date:"10/11/16, 12:00PM")
        var aWish2 = aWish(meaning:"positive",message:"You will get A",date:"10/11/16, 13:00PM")
        var aWish3 = aWish(meaning:"negative",message:"Don't Panic",date:"10/11/16, 14:00PM")
    
 
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(MyCustomCell.self, forCellReuseIdentifier: "Cell")
        


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

        }else{
            return 0

        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MyCustomCell


        
            let thiswish = allyourWish[indexPath.row]

        cell.myHeaderCell.text = thiswish.message
        cell.myDateCell.text = "Date: \(thiswish.date)"
        cell.myImgeView.image = UIImage(named : "opened_cookie.png")
        cell.myImageViewLabel.text = thiswish.message
        
        if thiswish.meaning=="positive" {
            cell.myHeaderCell?.textColor = UIColor(red: 0, green: 0.49, blue: 1, alpha: 1.0)
        }
        else {
            cell.myHeaderCell?.textColor = UIColor.orange
        }
        
        
     

       return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            tableView.beginUpdates()
            allyourWish.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }


//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 1
//
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 1
//    }



    
    
    
}



