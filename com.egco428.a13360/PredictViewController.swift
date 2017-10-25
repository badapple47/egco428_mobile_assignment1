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
        self.showToast(message: "waiting")
        
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

extension UIViewController {
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height/2, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
