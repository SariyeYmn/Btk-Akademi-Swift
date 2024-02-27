import UIKit

//Loops(Döngüler)

//While loop

5 == 5
5 == 4
5 != 4

3 < 9
3 < 2
2 > 1
2 >= 2
10 <= 10

var x=0

print("döngü başladıı")
while(x != 10)
{
    print(x)
    x += 1
}

print("döngü başladıı")

// for loop

var myArray = ["Sare","Kübra","Zeynep","Bora","Mithat","Anıl"]

print(myArray[3])

for name in myArray{
    print(name.uppercased())
}

var numaraDizisi = [10,20,30,40,50,60,70,80,90]

numaraDizisi[0] / 5*3

var sonuc = 0

for num in numaraDizisi{
    sonuc = num / 5 * 3
    print(sonuc)
}

//1 den 10 a kadar range oluşturdu
for newNumber in 1...10{
    print(newNumber)
}

//If Statements (If kotrolleri) Eğer kontrolleri

3==3
//AND &&
// OR ||

3 == 3 && 4 == 4
3 != 3 && 4 == 4
3 != 3 || 4 == 4
3 != 3 || 4 == 4

var myAge = 50

if myAge < 20{
    print("çok gençsin")
}
else  if myAge > 20 && myAge < 30 {
    print("yirmili yaşlarındasın")
}
else  if myAge > 30 && myAge < 40 {
    print("otuzlu  yaşlarındasın")
}
else{
    print("kırk yaşından büyüksün")
}
