//
//  ViewController.swift
//  LufthansaAPITest
//
//  Created by Will Oakley on 9/6/18.
//  Copyright © 2018 Will Oakley. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var image: UIImageView!
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI(){
        image = UIImageView(frame: CGRect(x: -300, y: 500, width: 300, height: 200))
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "plane")
        view.addSubview(image)
    }
    
    func animateImage(){
        UIView.animate(withDuration: 4, animations: {
            self.image.frame = CGRect(x: self.view.frame.maxX + 300, y: 400, width: 300, height: 200)
        }) { (done) in
            self.image.frame = CGRect(x: -300, y: 500, width: 300, height: 200)
        }
    }
    
    @IBAction func buttonPress(_ sender: Any) {
        
        //Gets new auth token and then gets flight status once that is successful
        LufthansaAPIHelper.getAuthToken() {
            LufthansaAPIHelper.getFlightStatus(flightNum: "LH001", date: "2018-10-04") { flt in
                self.label.text = "fix the thing you dummy"
                self.animateImage()
            }
        }
    }
}

