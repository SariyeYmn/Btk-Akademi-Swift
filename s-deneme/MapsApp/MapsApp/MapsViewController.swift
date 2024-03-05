//
//  ViewController.swift
//  MapsApp
//
//  Created by iOS-Lab07 on 4.03.2024.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    //konumla ilgili işlemleri ele almamızı sağlıyor.Başlatmak ve durdurmak gibi
    var locationManager = CLLocationManager()
    var choseLatitude = Double()
    var choseLongitude = Double()
    var choseName = ""
    var choseID = UUID?(<#UUID#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        //ne kadar doğru bir şekilde konumu almak istiyoruz
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //kullanıcıdan izin istemek
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(choseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func choseLocation(gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began {
            let dokunulanNokta = gestureRecognizer.location(in: mapView)
            let dokunulanKoordinat = mapView.convert(dokunulanNokta, toCoordinateFrom: mapView)
            
            choseLatitude = dokunulanKoordinat.latitude
            choseLongitude = dokunulanKoordinat.longitude
            //pin ekleme (işaretleyici)
            let annotation = MKPointAnnotation()
            annotation.coordinate = dokunulanKoordinat
            annotation.title = nameTextField.text
            annotation.subtitle = noteTextField.text
            mapView.addAnnotation(annotation)
        }
        
    }
    
    //konumlar güncellendi
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations[0].coordinate.latitude)
        //print(locations[0].coordinate.longitude)
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        let region = MKCoordinateRegion(center: location, span: span)
        //bi yere gitmek bölgeyi değiştirmek için
        mapView.setRegion(region , animated: true)
        
    }
    
    
    @IBAction func kaydetClick(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let yeniYer = NSEntityDescription.insertNewObject(forEntityName: "Yer", into: context)
        
        yeniYer.setValue(nameTextField.text, forKey: "name")
        yeniYer.setValue(noteTextField.text, forKey: "note")
        yeniYer.setValue(choseLatitude, forKey: "latitude")
        yeniYer.setValue(choseLongitude, forKey: "longitude")
        yeniYer.setValue(UUID(), forKey: "id")
        
        do{
            try context.save()
            print("kayıt edildi")
        }catch{
            print("hata")
        }
        
    }
    

}

