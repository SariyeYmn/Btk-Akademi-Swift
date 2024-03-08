//
//  IkinciViewController.swift
//  ViewControllerProject
//
//  Created by iOS-Lab11 on 23.02.2024.
//

import UIKit

class IkinciViewController: UIViewController {

    @IBOutlet weak var ikinciLabel: UILabel!
    
    @IBOutlet weak var bulunanSifreLabel: UILabel!
    
    var verilenSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bulunanSifreLabel.text = verilenSifre  
    }
    

}
