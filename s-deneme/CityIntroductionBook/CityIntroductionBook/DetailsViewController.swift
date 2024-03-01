//
//  DetailsViewController.swift
//  CityIntroductionBook
//
//  Created by iOS-Lab11 on 29.02.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var bolgeLabel: UILabel!
    
    var choseCity : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = choseCity?.name
        bolgeLabel.text = choseCity?.district
        image.image = choseCity?.image

 
    }
    

}
