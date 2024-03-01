//
//  User.swift
//  SwiftOOP
//
//  Created by iOS-Lab11 on 29.02.2024.
//

import Foundation

//veri tipi oluşturmak
enum KullaniciTipi{
    case AdminKullanici
    case NormalKullanici
    case YetkisizKullanici
}

class User {
    var name : String = ""
    var age  : Int = 0
    var job : String = ""
    var tip : KullaniciTipi
    private var gender : String = ""
    private var sacRengi : String = ""
    
    //initalizer
    
    init(name: String, age: Int, job: String, tip: KullaniciTipi) {
        print("init çağırıldı")
        self.name = name
        self.age = age
        self.job = job
        self.tip = tip
    }
    
    func exampleFunc(){
        print("Örnek fonksiyon çalıştırıldı..")
    }
    
    func testFunc(){
        print("test")
    }
    
    //Access Levels Erişilebilirlik seviyeleri
    //open - public - internal - fileprivate - private
    
    func sacRenginiAl() -> String {
        return self.sacRengi
    }
    
    
    
}
