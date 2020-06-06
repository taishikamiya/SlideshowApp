//
//  SlideViewController.swift
//  SlideshowApp
//
//  Created by Taishi Kamiya on 2020/06/06.
//  Copyright © 2020 taishi.kamiya. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    
    @IBOutlet weak var zoomImageView: UIImageView!
    
    var sentName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomImageView.image = UIImage(named: sentName)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
