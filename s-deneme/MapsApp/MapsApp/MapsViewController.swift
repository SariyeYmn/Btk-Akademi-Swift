
//  ViewController.swift
//  MapsApp

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
    var choseId : UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationlatitude = Double()
    var annotationLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        //ne kadar doğru bir şekilde konumu almak istiyoruz
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //kullanıcıdan izin istemek
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()//kullanıcının konumu neresiyse orayı göstermemizi sağlıyor.
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(choseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
        
        if choseName != ""{
            //CoreData dan verileri çek
            
            if let uuidString = choseId?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Yer")
                //filtreleme
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do{
                    let sonuclar = try context.fetch(fetchRequest)
                    
                    if sonuclar.count > 0 {
                        for sonuc in sonuclar as! [NSManagedObject]{
                            
                            if let name = sonuc.value(forKey: "name") as? String{
                                annotationTitle = name
                                if let not = sonuc.value(forKey: "note") as? String{
                                    annotationSubtitle = not
                                    if let latitude = sonuc.value(forKey: "latitude") as? Double{
                                        annotationlatitude = latitude
                                        if let longitude = sonuc.value(forKey: "longitude") as? Double{
                                            annotationLongitude = longitude
                                            
                                            let annotation = MKPointAnnotation()
                                            annotation.title = annotationTitle
                                            annotation.subtitle = annotationSubtitle
                                            let coordinate = CLLocationCoordinate2D(latitude: annotationlatitude, longitude: annotationLongitude)
                                            annotation.coordinate = coordinate
                                            
                                            mapView.addAnnotation(annotation)
                                            nameTextField.text = annotationTitle
                                            noteTextField.text = annotationSubtitle
                                            
                                            locationManager.stopUpdatingLocation()//konumu güncellemeyi durdur
                                            
                                            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                                            let region = MKCoordinateRegion(center: coordinate, span: span)
                                            mapView.setRegion(region, animated: true)
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }catch{
                    print("hata")
                }
            }
        }else{
            //yeni veri eklemeye geldi
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        let reuseId = "MyAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil{
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            //bizim oluşturacağımız annotation ekstra bir şey gösterebilir mi?(buton-görsel)
            pinView?.canShowCallout = true
            pinView?.tintColor = .purple
            
            let button = UIButton(type: .detailDisclosure)
            //callout da ne göstereceğimizi seçiyoruz.
            pinView?.rightCalloutAccessoryView = button
            
        }else{
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    //bizim oluşturduğumuz butonun(ayrıntılar butonu) üzerine tıklandığında ne olacağını belirliyoruz
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if choseName != ""{
            let requestLocation = CLLocation(latitude: annotationlatitude, longitude: annotationLongitude)
            CLGeocoder().reverseGeocodeLocation(requestLocation){ (placemarkArrey, hata) in
                
                if let placemarks = placemarkArrey{
                    if placemarks.count > 0 {
                        
                        let newPlacemark = MKPlacemark(placemark: placemarks[0])
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = self.annotationTitle
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                        
                        item.openInMaps(launchOptions: launchOptions)
                    }
                }
                
            }
        }
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
        if choseName == ""{
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
            let region = MKCoordinateRegion(center: location, span: span)
            //bi yere gitmek bölgeyi değiştirmek için
            mapView.setRegion(region , animated: true)
        }
        
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
        
        NotificationCenter.default.post(name: NSNotification.Name("yeniYerOlusturuldu"), object: nil)
        navigationController?.popViewController(animated: true)
        
    }
    

}

