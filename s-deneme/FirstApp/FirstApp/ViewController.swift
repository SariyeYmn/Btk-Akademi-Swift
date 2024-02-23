//
//  ViewController.swift
//  FirstApp
//
//  Created by iOS-Lab11 on 21.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labell: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button_click(_ sender: Any) {
        labell.text = "Sehirlerin Sultanı"
    }
    
}

