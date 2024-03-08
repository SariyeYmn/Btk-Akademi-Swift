//
//  OzelKullanici.swift
//  SwiftOOP
//
//  Created by iOS-Lab11 on 29.02.2024.
//

import Foundation
// kullanici sinifindan kalitim alıyorum demek
class OzelKullanici : User {
    
    func newFunction(){
        print("yeni fonksiyon çalıştırıldı")
    }
    
    override func exampleFunc() {
        super.exampleFunc()
        
        print("Özelden çalıştırılan örnek buydu")
        
    }
}
