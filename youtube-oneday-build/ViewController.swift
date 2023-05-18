//
//  ViewController.swift
//  youtube-oneday-build
//
//  Created by MAC on 16/05/23.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideo()
    }


}

