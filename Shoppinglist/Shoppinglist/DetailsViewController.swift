//
//  DetailsViewController.swift
//  Shoppinglist
//
//  Created by iOS-Lab11 on 1.03.2024.
//
import CoreData
import UIKit

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productSize: UITextField!
    @IBOutlet weak var kaydetButton: UIButton!
    
    var choseProductName = ""
    var choseProductUUID : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if choseProductName != ""{
            kaydetButton.isHidden = true
            //Core Data seçilen ürün bilgilerini göster
            
            if let uuidString = choseProductUUID?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
                //filtreleme işlemi
                //NSPredicate mantıksal sınırlamalar koyup buna göre işlem yapacaksın
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do{
                    let sonuclar  = try context.fetch(fetchRequest)
                    if sonuclar.count > 0 {
                        for sonuc in sonuclar as! [NSManagedObject]{
                            if let isim = sonuc.value(forKey: "isim") as? String{
                                productName.text = isim
                            }
                            
                            if let fiyat = sonuc.value(forKey: "fiyat") as? Int{
                                productPrice.text = String(fiyat)
                            }
                            
                            if let beden = sonuc.value(forKey: "beden") as? String{
                                productSize.text = beden
                            }
                            
                            if let gorselData = sonuc.value(forKey: "gorsel") as? Data{
                                let image = UIImage(data: gorselData)
                                imageView.image = image
                            }
                        }
                        
                    }
        
                }catch{
                    print("hata var")
                }
                
            }
            
        }else{
            kaydetButton.isHidden = false //gizleme
            kaydetButton.isEnabled = false //tıklama
            productName.text = ""
            productPrice.text = ""
            productSize.text = ""
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardClose))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choseImage))
        view.addGestureRecognizer(imageGestureRecognizer)
    }
    
   
    @objc func choseImage(){
        //fotogrf cekmek, galerideki fotograflara ulaşmak için bu sınıf kullanılıyor.
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        kaydetButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        //dismiss : imagepickercontroller ı kapat imageview a geri dön
    }
    @objc func keyboardClose(){
        view.endEditing(true)
    }
    
    
    @IBAction func kaydetButtonClick(_ sender: Any) {
        
        //appdelegate i değişken  olarak tanımlama
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        alisveris.setValue(productName.text!, forKey: "isim")
        alisveris.setValue(productSize.text!, forKey: "beden")
        
        if let price = Int(productPrice.text!){
            alisveris.setValue(price, forKey: "fiyat")
        }
        
        //universal unique id
        alisveris.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        alisveris.setValue(data, forKey: "gorsel")
        
        do{
            try context.save()
            print("Kayıt edildi")
        }catch{
            print("hata var")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
        
    }
}
