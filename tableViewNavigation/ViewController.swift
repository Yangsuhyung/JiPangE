//
//  ViewController.swift
//  tableViewNavigation
//
//  Created by cscoi054 on 2017. 2. 1..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var passData: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let filename = passData! + ".jpg"
        let displayFrame = self.view.frame
        
        var img = UIImage(named: filename)
        var imageView = UIImageView(image:img)
        
        imageView.frame = CGRect(x:0, y:0, width:displayFrame.size.width, height : displayFrame.size.height)
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

