//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Taishi Kamiya on 2020/06/06.
//  Copyright © 2020 taishi.kamiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Timer
    var timer: Timer!
    //time
    var timer_sec:Float = 0
    
    // flag
    var buttonFlag: Bool = false
    
    //image
    let imageName = ["Image1","Image2","Image3","Image4"]
    var count = 0
//    var img : Array<UIImage> = []
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var playBtnLabel: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    @IBAction func rewind(_ sender: UIButton) {
        if  buttonFlag==false {
            count-=1
            if(count<0) {count=3}
                if(count<=3 && count>=0){
                    let name = imageName[count]
                    displayImg(name)
            }
        }
    }
    
    @IBAction func forward(_ sender: UIButton) {
        if  buttonFlag==false {
            count+=1
            if(count>3) {count=0}
                if(count<=3 && count>=0){
                    let name = imageName[count]
                    displayImg(name)
            }
        }
    }
    
    func displayImg(_ imgName: String){
        ImageView.image = UIImage(named: imgName)
    }
    
    @IBAction func play(_ sender: UIButton) {
//        sender.setTitle("停止", for: .normal)

        if buttonFlag == false {
            sender.setTitle("停止", for: .normal)
            buttonFlag=true
            //timer start
            if self.timer == nil{
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(countUp(_:)), userInfo: nil, repeats: true)
            }
        } else if buttonFlag == true {
            sender.setTitle("再生", for: .normal)
            buttonFlag=false
            if self.timer != nil{
                self.timer_sec=0
                self.timer.invalidate()
                self.timer = nil
            }
        }
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            let name = imageName[count]
            displayImg(name)
    }
    
    //  prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //segueから遷移先のSlideViewControllerを取得
        let slideViewController: SlideViewController = segue.destination as! SlideViewController
        
        slideViewController.sentName = imageName[count]

    }

    // updateTimer
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 0.1
    }
    
    @objc func countUp(_ timer: Timer){
        count+=1
        if(count>3) {count=0}
        let name = imageName[count]
        displayImg(name)
    }

}

