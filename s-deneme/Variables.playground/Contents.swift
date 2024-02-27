import UIKit

//String
var userName = "Sare"
var userSurname = "Sareee"

print(userName)

userName = "sare"

print(userName)

userName.uppercased()
userName.append("11")

//integer - int
var internettenGelenEnYeniVeri = 50 // camelCase - genelde kullanılır.
var internetten_gelen_en_yeni_veri = 50 //snake_case

let myNumber = 70 // sabit oluşturmak için kullanılır

myNumber.isMultiple(of: 2)// myNumber2 nin çarpımı mı kontrolü

print(myNumber)

let birinciNumaram = 40
let ikinciNumaram = 6

birinciNumaram / ikinciNumaram

//double
let pi = 3.14

let doubleNumaram = 80.0
let ikincidoubleNumaram = 3.3
doubleNumaram / ikincidoubleNumaram

//boolean
var myBoolean = true
myBoolean = false

//: hangi veritipi olduğunu belirtmek için kullanıyoruz.
var benimSayim: Int16 = 50
//benimSayim = 5000000000000 - taşma oluyor overflows hatası alınıyor.

let benimYeniDouble : Float = 3.14

// defining , tanımlama
let myString : String

//initialization(değerini atama , başlatma)
myString = "Sare"

var myNewNumber : Int
//myNewNumber = "Zeynep" hata verir
myNewNumber = 30

let benimStringNumarama : String

benimStringNumarama = String(myNewNumber)
benimStringNumarama + "10"

let stringNo = "400"
let integerString = Int(stringNo)
integerString! + 33











