//
//  FlagAddViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import FirebaseDatabase
import Cosmos

class FlagAddViewController: UIViewController {
    private let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    public var TeammateData: ((String?, String?, String?) -> Void)?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextView!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    
    
    @IBAction func saveTeamMemberBtn(_ sender: UIButton) {

        let name = nameTextField.text
        let address = addressTextField.text
        let task = taskTextField.text
        let tags = tagsTextField.text
        let description = descriptionTextView.text
        let rating = ratingView.rating
        
        if name != "" && address != "" && task != "" && tags != "" && description != ""{
    
            let flagsRef = ref.child("flags").childByAutoId()
            let uid = flagsRef.key
            
            let flagObject: [String:Any] = [
                "uid": uid ?? "" as NSObject,
                "name": name ?? "",
                "address": address ?? "",
                "task": task ?? "",
                "tags": tags ?? "",
                "description": description ?? "",
                "rating": rating 
            ]

            
            flagsRef.setValue(flagObject)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
