import UIKit

func ornekFonksiyon(){
    print("Example")
}

ornekFonksiyon()
 
//Parametre-input
func myFunction(a : String){
    print("Welcome " + a)
}

myFunction(a: "Sare")

//Output-return

func toplama(x: Int , y:Int){
    print(x+y)
}

toplama(x: 24, y: 36)

func carpma (x:Int ,y: Int) -> Int{
    return x * y
}

var carpmaSonuc = carpma(x: 22, y: 10)
print(carpmaSonuc)

func logicFunction(x: Int, y: Int) -> Bool {
    if x > y{
        return true
    }
    else{
        return false
    }
}

print(logicFunction(x: 122, y: 12))

//Opsiyoneller (Optionals)
//String ifadesinin sonuna ? konursa opsiyonel olur.Değer verilmediği durumlarda nil gelir.
var myName : String?

myName = "Sare"

var userNumber = "20"

//var sonuc = Int(userNumber)! * 5
//force unwrapping
// integer ifadenin sonuna konulan  ! kesinlikle emin olduğumuz durumlarda kullanılır.

var sonuc = (Int(userNumber) ?? 1) * 5

if let yeniSonuc = Int(userNumber){
    yeniSonuc
}
else{
    print("Lütfen sayi giriniz")
}


