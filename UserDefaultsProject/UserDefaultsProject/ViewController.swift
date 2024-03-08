//
//  ViewController.swift
//  UserDefaultsProject
//
//  Created by iOS-Lab11 on 23.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var notTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "time")
        
        // as-> casting
        if let gelenNot = kaydedilenNot as? String{
            notLabel.text = "Yapilacak iş: \(gelenNot)"
        }
        
        if let gelenZaman = kaydedilenZaman as? String{
            timeLabel.text = "Yapilacak zaman: \(gelenZaman)"
        }
    }

    
    @IBAction func kaydetClick(_ sender: Any) {
        
        UserDefaults.standard.set(notTextField.text!, forKey: "not")
        UserDefaults.standard.set(timeTextField.text!, forKey: "time")
        
        notLabel.text = "Yapilacak iş: \(notTextField.text!)"
        timeLabel.text = "Yapilacak zaman: \(timeTextField.text!)"
        
    }
    
    
    @IBAction func silClick(_ sender: Any) {
    }
    
}

