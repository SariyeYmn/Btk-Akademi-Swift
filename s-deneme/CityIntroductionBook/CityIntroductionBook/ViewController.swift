//
//  ViewController.swift
//  CityIntroductionBook
//
//  Created by iOS-Lab11 on 29.02.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var cityArray = [City]()
    var userChose : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let istanbul = City(name: "İstanbul", district: "Marmara Bölgesi", image: UIImage(named: "istanbul1")!)
        let konya = City(name: "Konya", district: "İç Anadolu Bölgesi", image: UIImage(named: "konya")!)
        let izmir = City(name: "İzmir", district: "Ege Bölgesi", image: UIImage(named: "izmir")!)
        let artvin = City(name: "Artvin", district: "Karadeniz Bölgesi", image: UIImage(named: "artvin")!)
        
        
        cityArray = [istanbul,konya,izmir,artvin]
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cityArray[indexPath.row].name
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
            if editingStyle == .delete{
                cityArray.remove(at: indexPath.row)
                cityDistrict.remove(at : indexPath.row)
                cityImageNames.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
        }
     */
    
    
    //segue oluşturmak
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           userChose = cityArray[indexPath.row]
           performSegue(withIdentifier: "toDetailsVC", sender: nil )
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.choseCity = userChose
        }
    }
     
    

    

}

