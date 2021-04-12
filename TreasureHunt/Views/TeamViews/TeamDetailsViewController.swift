//
//  TeamDetailsViewController.swift
//  TreasureHunt
//
//  Created by Esther Kim on 2021-04-08.
//
import UIKit
import MessageUI

class TeamDetailsViewController: UIViewController {
    private var phoneNum = "1231231234" // replace with input phone number, but make sure to format the number before attempting to call
    private var email = "someone@georgebrown.ca" // replace with team member's email
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = "Tim"
        phoneLbl.text = phoneNum
        emailLbl.text = email
    }

    @IBAction func callMember(_ sender: UIButton) {
        makeCall(phoneNum)
    }

    @IBAction func textMember(_ sender: UIButton) {
        makeText(phoneNum)
    }

    @IBAction func emailMember(_ sender: UIButton) {
        makeEmail(email)
    }

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
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

}
