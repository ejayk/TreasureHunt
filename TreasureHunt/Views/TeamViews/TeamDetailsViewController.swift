//
//  TeamDetailsViewController.swift
//  TreasureHunt
//
//  Created by Esther Kim on 2021-04-08.
//
import UIKit
import MessageUI

class TeamDetailsViewController: UIViewController {
//    public var name = ""
//    public var phoneNum = ""
//    public var email = ""
    
    public var teamMember = TeamMember.init(uid: "",
                                            name: "",
                                            phoneNo: "",
                                            email: "")
    public var didUpdate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = teamMember.name
        phoneLbl.text = teamMember.phoneNo
        emailLbl.text = teamMember.email
    }
    
    @IBAction func callMember(_ sender: UIButton) {
        makeCall(teamMember.phoneNo)
    }
    
    @IBAction func textMember(_ sender: UIButton) {
        makeText(teamMember.phoneNo)
    }
    
    @IBAction func emailMember(_ sender: UIButton) {
        makeEmail(teamMember.email)
    }
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var phoneTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    
    
    // Functions for interacting
    func makeCall(_ phoneNumber: String){
        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {
            let alert = UIAlertController(title: ("Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: {
                (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func makeText(_ phoneNumber: String){
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = ""
            controller.recipients = [phoneNumber]
            controller.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            self.present(controller, animated: true, completion: nil)
        }
        //This is just for testing purpose as when you run in the simulator, you cannot send the message.
        else{
            print("Cannot send message, please try again.")
        }
        func messageComposeViewController(controller:
                                            MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
            //Displaying the message screen with animation.
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func makeEmail(_ email: String){
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mail.setToRecipients([email])
            mail.setMessageBody("<h1>Treasure Hunt!<h1> Hi! This is a test!", isHTML: true)
            present(mail, animated: true)
        } else {
            print("Cannot send email, please try again.")
        }
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
    
    //MARK: Update on the same page
    @IBAction func updateBtn(_ sender: UIButton) {
        var name = teamMember.name
        var email = teamMember.email
        var phoneNo = teamMember.phoneNo
        
        if !didUpdate{
            //Changing name
            nameTextView.isHidden = false
            nameLbl.isHidden = true
            nameTextView.text = name
            
            //Changing Phone
            phoneTextView.isHidden = false
            phoneLbl.isHidden = true
            phoneTextView.text = phoneNo
            
            //Changing Email
            emailTextView.isHidden = false
            emailLbl.isHidden = true
            emailTextView.text = email
            
            didUpdate = true
        }else{
            //changing name
            nameTextView.isHidden = true
            nameLbl.isHidden = false
            name = nameTextView.text!
            nameLbl.text = teamMember.name
            
            //Changing Phone
            phoneTextView.isHidden = true
            phoneLbl.isHidden = false
            phoneNo = phoneTextView.text!
            phoneLbl.text = teamMember.phoneNo
            
            //Changing Email
            emailTextView.isHidden = true
            emailLbl.isHidden = false
            email = emailTextView.text!
            emailLbl.text = teamMember.email
            
            print(teamMember.name)
            
            didUpdate = false
        }
        
    }
    
}
