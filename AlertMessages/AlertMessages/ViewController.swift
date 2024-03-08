//
//  ViewController.swift
//  AlertMessages
//
//  Created by iOS-Lab11 on 26.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var password2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SignUpClick(_ sender: Any) {
        let alertMessage = UIAlertController(title: "Hata mesajı1", message: "Email yanlış girildi", preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
           //OK butonuna tıklanınca olacaklar
            print("ok butonun tiklandi.")
        }
        
        alertMessage.addAction(okButton)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    

}

