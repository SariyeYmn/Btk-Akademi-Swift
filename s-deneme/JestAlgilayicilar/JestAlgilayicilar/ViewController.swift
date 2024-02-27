//
//  ViewController.swift
//  JestAlgilayicilar
//
//  Created by iOS-Lab11 on 27.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var ankara = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(gorselDegistir))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func gorselDegistir (){
        
        if ankara == false {
            imageView.image = UIImage(named: "ankara")
            label.text = "Ankara"
            ankara = true
        }
        else{
            imageView.image = UIImage(named: "istanbul")
            label.text = "Istanbul"
            ankara = false
        }
    }


}

