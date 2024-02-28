//
//  ViewController.swift
//  SuperHeroBook
//
//  Created by iOS-Lab03 on 28.02.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
   
   
    
    //tableview oluştururken her zaman yapmamız gereken işlemler aklımızda bulunması gerekiyor
    //tableview i kullanmak için iki tane fonksiyon yazmamız gerekiyor 1- hücrede ne gösterilecek 2-kaç tane hücre olacak

    @IBOutlet weak var tableView: UITableView!
    var superHeroNames = [String]()
    var superHeroImageNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //bu tarz veriler veritabanından gelir
        
        
        superHeroNames.append("Iron Man")
        superHeroNames.append("Captan America")
        superHeroNames.append("Doctor Strange")
        superHeroNames.append("Thor")
        superHeroNames.append("Hulk")
        superHeroNames.append("Superman")
        
        
        superHeroImageNames.append("ironman")
        superHeroImageNames.append("captanamerica")
        superHeroImageNames.append("strange")
        superHeroImageNames.append("thor")
        superHeroImageNames.append("hulk")
        superHeroImageNames.append("superman")
        
    }
    
     //numberOfRowsInSection -> bir bölümde  kaç tane row olacak
    // cellForRow atIndexPath ->hücrenin içinde neler gösterilecek
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
    }
    
    //tableview da da dizilerdeki gibi index mantığı var
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            superHeroNames.remove(at: indexPath.row)
            superHeroImageNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil )
    }
}

