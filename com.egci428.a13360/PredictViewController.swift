//
//  PredictViewController.swift
//  com.egci428.a13360
//
//  Created by Pathompong Chaisri on 10/23/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct aWish2 {
    var meaning : String
    var message : String
    var date  : String
    
}

var alotofWish : aWish2 = aWish2(meaning: "", message: "", date: "")






class PredictViewController: UIViewController {


    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var cookiePic: UIImageView!
    
    @IBOutlet weak var cookieLabel: UILabel!
    //    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var makeAWishbtn: UIButton!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        

        
        self.navigationItem.title = "Fortune Cookies"
        
    

        // Do any additional setup after loading the view.
    }

    @IBAction func makeAWish(_ sender: Any) {
        Alamofire.request("http://www.atilal.info/cookies.php").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                print(json)
                print("jsonja: \(json["meaning"].stringValue)")
                self.resultLabel.text = "Result :  \(json["message"].stringValue) "
                

                
              
                
                // get the current date and time
                let currentDateTime = Date()
                
                // initialize the date formatter and set the style
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                formatter.dateStyle = .short
                
                // get the date time String from the date object
                let resultdate = formatter.string(from: currentDateTime)
                
                print(resultdate)
                self.dateLabel.text = "Date : \(resultdate)"
                
                
                
                
                
                self.cookiePic.image = UIImage(named: "opened_cookie")
                
                self.cookieLabel.text = json["message"].stringValue
                
                
                self.makeAWishbtn.isHidden = true
                
                
                
                
                 alotofWish.message = json["message"].stringValue
                 alotofWish.meaning = json["meaning"].stringValue
                 alotofWish.date = resultdate
                
               
                
              
                
               
                
                
                
                
                
                
                
                
                
                
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
   
    @IBAction func saveBtnClick(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let MasterDetailVC =  segue.destination as? MasterDetailVC {

            MasterDetailVC.meaning = alotofWish.meaning
            MasterDetailVC.message = alotofWish.message
            MasterDetailVC.date = alotofWish.date
            
            
        }
    }
    
 
    
    


}
