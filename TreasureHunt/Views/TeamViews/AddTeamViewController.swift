//
//  AddTeamViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import FirebaseDatabase

class AddTeamViewController: UIViewController {
    private let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func saveTeamMemberBtn(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        
        if name != "" && phone != "" && email != ""{
            let addTeam = ref.child("team_members").childByAutoId()
            let uid = addTeam.key!
            
            let memberToAdd = TeamMember(uid: uid,
                                         name: name,
                                         phoneNo: phone,
                                         email: email)
            let memberObject: [String:Any] = [
                "uid": memberToAdd.uid as NSObject,
                "name": memberToAdd.name,
                "phoneNo": memberToAdd.phoneNo,
                "email": memberToAdd.email
            ]

            
            addTeam.setValue(memberObject)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
