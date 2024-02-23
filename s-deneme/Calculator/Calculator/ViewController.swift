//
//  ViewController.swift
//  Calculator
//
//  Created by iOS-Lab11 on 22.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ilkText: UITextField!
    
    @IBOutlet weak var ikinciText: UITextField!
    
    @IBOutlet weak var sonuc: UILabel!
    
    var sonuc1 =  0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func plusClick(_ sender: Any) {
        
        if let number1 = Int(ilkText.text!){
            if let number2 = Int(ikinciText.text!){
                sonuc1 = number1 + number2
                sonuc.text = String(sonuc1)
            }
        }
    }
    
    
    @IBAction func subtractionClick(_ sender: Any) {
        if let number1 = Int(ilkText.text!){
            if let number2 = Int(ikinciText.text!){
                sonuc1 = number1 - number2
                sonuc.text = String(sonuc1)
            }
        }
    }
    
    
    @IBAction func divisionClick(_ sender: Any) {
        if let number1 = Int(ilkText.text!){
            if let number2 = Int(ikinciText.text!){
                sonuc1 = number1 / number2
                sonuc.text = String(sonuc1)
            }
        }
    }
    
    @IBAction func multiplicationClick(_ sender: Any) {
        if let number1 = Int(ilkText.text!){
            if let number2 = Int(ikinciText.text!){
                sonuc1 = number1 * number2
                sonuc.text = String(sonuc1)
            }
        }
    }
    
    
    
}

