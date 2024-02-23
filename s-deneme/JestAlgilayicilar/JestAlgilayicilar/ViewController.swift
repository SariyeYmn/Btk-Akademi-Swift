//
//  ViewController.swift
//  JestAlgilayicilar
//
//  Created by iOS-Lab11 on 23.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        // jest algılayıcıgorselDegistir
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselDegistir))
        
        imageView.addGestureRecognizer(gestureRecognizer)
                                                       
    }
                                                       
    @objc func gorselDegistir()
        {
            print("tıklandı")
        }

}

