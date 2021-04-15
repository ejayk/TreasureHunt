//
//  TeamViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import FirebaseDatabase

class TeamViewController: UIViewController {

    fileprivate let CELL_ID = "TeamCell"
    
    var teamMembers: [TeamMember] = []
    var test = ""
    
    private let team_members_reference: DatabaseReference = Database.database().reference(withPath: "team_members")
    
    @IBOutlet weak var teamMembersTblView: UITableView!
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        let addTeamVC = storyboard?.instantiateViewController(identifier: "AddTeam") as! AddTeamViewController
        addTeamVC.modalPresentationStyle = .automatic
        present(addTeamVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamMembersTblView.dataSource = self
        team_members_reference.observeSingleEvent(of: .value) { (snapshot) in
            let snaps = snapshot.children.allObjects.compactMap({$0 as? DataSnapshot})
            let dicts = snaps.compactMap({$0.value as? NSDictionary})
            print(dicts)
            for dict in dicts{
                self.teamMembers.append(TeamMember.init(name: dict["name"] as! String,
                                                   phoneNo: dict["phoneNo"] as! String,
                                                   email: dict["email"] as! String))
            }
            self.teamMembersTblView.reloadData()
        }
    }
}

// MARK:- TableView Setup
// Setting up the cells for the table view controller
extension TeamViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        let teamMember = teamMembers[indexPath.row]
        
        cell.textLabel?.text = "Name: \(teamMember.name)"
        return cell
        
    }
}
