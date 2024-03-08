//
//  ViewController.swift
//  LayoutProject
//
//  Created by iOS-Lab11 on 23.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        //Label
        
        let myLabel = UILabel()
        myLabel.text = "Sare"
        myLabel.textAlignment = .center
        
        myLabel.frame = CGRect(x: width * 0.5 - 50 , y: height * 0.5 - 50, width: 100, height: 100)
        
        view.addSubview(myLabel)
        
        //Button
        
        let myButton = UIButton()
        myButton.setTitle("MyButton", for:  UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for:  UIControl.State.normal)
        myButton.frame = CGRect(x: width * 0.5 - 100 , y: height * 0.65 , width: 200, height: 100)
        view.addSubview(myButton)
        
        //self kendi - içinde bulunduğu sınıfa referans verir.
        myButton.addTarget(self, action: #selector(ViewController.myFunc), for: UIControl.Event.touchUpInside)
    }
    //IBAction da kullanılabilir
    @objc func myFunc(){
        print("Kullanıcı butona tıkladı.")
    }
    
    


}

