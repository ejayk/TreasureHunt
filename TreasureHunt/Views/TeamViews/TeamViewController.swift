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
    
    private let ref = Database.database().reference()
    
    @IBOutlet weak var teamMembersTblView: UITableView!
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        let addTeamVC = storyboard?.instantiateViewController(identifier: "AddTeam") as! AddTeamViewController
        addTeamVC.modalPresentationStyle = .automatic
//        addTeamVC.TeammateData = { name, phone, email in
//            self.setTeammate(name: name!, phoneNo: phone!, email: email!)
//            self.test = name!
//            print("test button: \(self.test)")
//        }
        present(addTeamVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamMembersTblView.dataSource = self
        
//        ref.child("team_members/-MY1vywLQOvMb6dRzNIf").observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let value = snapshot.value as? [String: Any] else{
//                return
//            }
//
//            //let teamMember = value;
//        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }

    
//    func setTeammate(name: String, phoneNo : String,  email: String) -> Void{
//        teamMembers.append(TeamMember(name: "name", phoneNo: "phoneNo", email: "email"))
//    }
    
    
}

// MARK:- TableView Setup
// Setting up the cells for the table view controller
extension TeamViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//teamMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        //let teamMember = teamMembers[indexPath.row]
        
        cell.textLabel?.text = "Tim"//teamMember.name
        return cell
    }
}
