//
//  FlagsViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import FirebaseDatabase

class FlagsViewController: UIViewController {

    @IBOutlet weak var flagsTbl: UITableView!
    fileprivate let CELL_ID = "FlagCell"
    
    private let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagsTbl.dataSource = self
    
        
    }
    
}

// MARK:- TableView Setup
// Setting up the cells for the table view controller
extension FlagsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        
        cell.textLabel?.text = "George Brown"
        
        return cell
    }
}
