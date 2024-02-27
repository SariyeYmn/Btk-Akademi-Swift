import UIKit

//-----Koleksiyon , collections----


//1-Arrey,Dizi
var ilkDizimiz = ["Sare","kübra","zeynep"]

//index
ilkDizimiz[2]

ilkDizimiz[1]="muge"

var ikinciDizimiz = [10,20,30,40]

ikinciDizimiz[2] * 5/10

var karisikDizimiz = [100,200,"Atıl",true,false] as [Any]
// as-->casting  , any --> any object

var yeniDegisken = karisikDizimiz[2] as! String

karisikDizimiz.append("Mithat")
karisikDizimiz.count
karisikDizimiz[karisikDizimiz.count-2]
karisikDizimiz.last

var numbers = [4,8,1,13,33,44,13]
numbers.sort()

var harfler = ["k","l","a","s","z","b"]
harfler.sort()

//2-Set
// içerisinde bir eleman sadece bir defa barınıyor.

var numaralar = [1,1,1,1,2,2,2,5,6,7,8,8]

var numaraSeti : Set  = [1,1,1,1,1,2,2,3,4,5,6]
numaraSeti.remove(5)
numaraSeti

var siparislerDizisi = ["Istanbul" , "Istanbul" ,"Ankara","Adana"]
siparislerDizisi.count

var siparislerSeti = Set(siparislerDizisi)
siparislerSeti.count

let birinciSet:Set = [40,50,60]
let ikiniSet:Set = [50,60,70]

let birlesimSeti = birinciSet.union(ikiniSet)

//3-Dictionary
//key-value pairing - anahtar kelime -değer eşleşmesi

let meyveDizisi = ["Armut" , "Muz" , "Elma" , "Karpuz"]
let kaloriDizisi = [100,150,200,300]
meyveDizisi[2]
kaloriDizisi[2]

var meyveKaloriDictionary = ["Armut":100,"Muz":150,"Elma":200,"Karpuz":300]

meyveKaloriDictionary["Armut"]

meyveKaloriDictionary.keys
meyveKaloriDictionary.values

meyveKaloriDictionary["Muz"] = 200
