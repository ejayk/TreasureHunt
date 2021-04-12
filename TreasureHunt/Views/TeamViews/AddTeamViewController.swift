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
    
    
    public var TeammateData: ((String?, String?, String?) -> Void)?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func saveTeamMemberBtn(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        
        if name != "" && phone != "" && email != ""{
            //TeamViewController.setTeammate(name: name, phoneNo: phone, email: email)
            
            let memberToAdd = TeamMember(name: name,
                                         phoneNo: phone,
                                         email: email)
            let memberObject: [String:Any] = [
                "name": memberToAdd.name as NSObject,
                "phoneNo": memberToAdd.phoneNo,
                "email": memberToAdd.email
            ]

            
            ref.child("team_members").childByAutoId().setValue(memberObject)
            TeammateData?(name, phone, email)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
