//
//  ViewController.swift
//  ListOfCars
//
//  Created by IMCS on 8/30/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit

struct cellData {
    let cell : Int!
    let text : String!
    let image : UIImage!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayOfCellData = [cellData]()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.imageOfCar.image = arrayOfCellData[indexPath.row].image
        cell.nameOfCar.text = arrayOfCellData[indexPath.row].text
        return cell
    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCellData = [cellData(cell: 1, text: "Car1 Name", image: #imageLiteral(resourceName: "car2")),
                           cellData(cell: 2, text: "Car2 Name", image: #imageLiteral(resourceName: "car1")),
                           cellData(cell: 3, text: "Car3 Name", image: #imageLiteral(resourceName: "car3")),
                           cellData(cell: 4, text: "Car4 Name", image: #imageLiteral(resourceName: "car5")),
                           cellData(cell: 5, text: "Car5 Name", image: #imageLiteral(resourceName: "car4"))]
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let viewController = segue.destination as! DetailsViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            viewController.receivedCell = arrayOfCellData[indexPath.row]
           
        }

    }
}

