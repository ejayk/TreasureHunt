//
//  FlagsViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import FirebaseDatabase

class FlagsViewController: UIViewController, UITableViewDelegate {
    
    var flags: [Flag] = []
    
    fileprivate let CELL_ID = "FlagCell"
    
    private let flags_reference: DatabaseReference = Database.database().reference(withPath: "flags")
    
    @IBOutlet weak var flagsTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagsTbl.dataSource = self
        flagsTbl.delegate = self
        flags_reference.observeSingleEvent(of: .value) { (snapshot) in
            let snaps = snapshot.children.allObjects.compactMap({$0 as? DataSnapshot})
            let dicts = snaps.compactMap({$0.value as? NSDictionary})
            for dict in dicts{
                self.flags.append(Flag.init(name: dict["name"] as! String,
                                            address: dict["address"] as! String,
                                            task: dict["task"] as! String,
                                            tags: dict["tags"] as! String,
                                            description: dict["description"] as! String,
                                            rating: dict["rating"] as! Double))
            }
            self.flagsTbl.reloadData()
        }
    }
    
}

// MARK:- TableView Setup
// Setting up the cells for the table view controller
extension FlagsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        let flag = flags[indexPath.row]
        
        //FIX FORMATING BY ADDING A CELL VIEW
        cell.textLabel?.text = "Name: \(flag.name) Location: \(flag.address)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "FlagDetailsViewController") as? FlagDetailsViewController
        let flag = flags[indexPath.row]
        vc?.flag = flag
        vc?.title = "\(flag.name) Details"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
