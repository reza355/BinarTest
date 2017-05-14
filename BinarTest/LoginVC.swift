//
//  LoginVC.swift
//  
//
//  Created by Fathureza Januarza on 5/14/17.
//
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class LoginVC: UIViewController {

    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var passLbl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        if let keyCheck = KeychainWrapper.standard.string(forKey: "KEY_UID"){
            performSegue(withIdentifier: "ListBarangVC", sender: self)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInBtn(_ sender: UIButton){
        if emailLbl.text != nil && passLbl.text != nil{
            FIRAuth.auth()?.signIn(withEmail: emailLbl.text!, password: passLbl.text!) { (user, error) in
                if error != nil{
                    let alert = UIAlertController(title: "Time Out", message: "Wrong Email or Password", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }else{
                    if let user = user{
                        self.completeSignIn(token: user.uid)
                    }
                }
            }
        }else{
            let alert = UIAlertController(title: "Time Out", message: "Email or Password can't be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func completeSignIn(token: String){
        let keychainResult = KeychainWrapper.standard.set(token, forKey: "KEY_UID")
        performSegue(withIdentifier: "ListBarangVC", sender: self)
    }

}
