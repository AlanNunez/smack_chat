//
//  CreateAccountVC.swift
//  smack_chat
//
//  Created by Desarrollo on 1/8/19.
//  Copyright © 2019 Dev Core. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    @IBOutlet weak var userImg: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    @IBAction func createAccntPressed(_ sender: Any) {
        
        guard let name = usernameTxt.text, usernameTxt.text != "" else {
            return
        }
        guard let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        guard let pass = passTxt.text, passTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) {
            (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if  success {
                        AuthService.instance.createUser(avatarName: self.avatarName, avatarColor: self.avatarColor, name: name, email: email, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
