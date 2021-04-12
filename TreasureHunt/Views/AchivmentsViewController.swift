//
//  AchivmentsViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import FirebaseDatabase

class AchivmentsViewController: UIViewController {

    @IBOutlet weak var achivmentTable: UITableView!
   
    fileprivate let CELL_ID = "AchievementCell"
    
    private let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        achivmentTable.dataSource = self
    
        
    }
    
}

// MARK:- TableView Setup
// Setting up the cells for the table view controller
extension AchivmentsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        
        let achivmentTitle = "Treasure Hunter"
        cell.textLabel?.text = "\(achivmentTitle) - Bronze"
        cell.textLabel?.text = "\(achivmentTitle) - Silver"
        cell.textLabel?.text = "\(achivmentTitle) - Gold"
        
        return cell
    }
}
