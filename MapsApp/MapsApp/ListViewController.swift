//
//  ListViewController.swift
//  MapsApp
//
// 5.03.2024.
//

import UIKit
import CoreData

class ListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var chosePlaceName = ""
    var chosePlaceId : UUID?
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusClick))
        
        veriAl()

    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(veriAl), name: NSNotification.Name("yeniYerOlusturuldu"), object: nil)
    }
    
    @objc func veriAl(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "Yer")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let sonuclar = try context.fetch(fetchRequest)
            if sonuclar.count > 0 {
                nameArray.removeAll(keepingCapacity: false)
                idArray.removeAll(keepingCapacity: false)
                for sonuc in sonuclar as! [NSManagedObject]{
                    if let isim = sonuc.value(forKey: "name") as? String{
                        nameArray.append(isim)
                        
                    }
                    
                    if let id = sonuc.value(forKey: "id") as? UUID{
                        idArray.append(id)
                    }
                   
                }
                tableView.reloadData()
            }
        } catch{
            print("hata")
        }
        
        
    }
    
    @objc func plusClick(){
        chosePlaceName = ""
        performSegue(withIdentifier: "toMapsVC", sender: nil)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosePlaceName = nameArray[indexPath.row]
        chosePlaceId = idArray[indexPath.row]
        performSegue(withIdentifier: "toMapsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapsVC"{
            let  destinationVC = segue.destination as! MapsViewController
            destinationVC.choseName = chosePlaceName
            destinationVC.choseId = chosePlaceId
        }
    }
    
    
    
    


}
