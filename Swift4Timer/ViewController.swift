//
//  ViewController.swift
//  Swift4Timer
//
//  Created by tatsumi kentaro on 2018/02/02.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewLabel: UILabel!
    
    @IBOutlet weak var result: UILabel!
    
    var timer: Timer = Timer()
    
    var count:Float = 0.0
    
    var num :Float = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stop(_ sender: Any) {
        if timer.isValid {
            timer.invalidate()
            if count == 10.0{
                result.text = "great"
                
            }else if count>10.0{
                result.text = "Too late"
            }else if count>=9.00 && count<10.0{
                result.text = "near count"
            }else{
                result.text = "not good"
            }
            
        }
    }
    
    @IBAction func start1(_ sender: Any) {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        
        if !timer.isValid {
            count = 0.0
            viewLabel.text = String(count)
            result.text = ""
        }
    }
    
    
    @objc func update(){
        count += 0.01
        viewLabel.text = String(format:"%.2f",count)
    }
    
    
    
}
