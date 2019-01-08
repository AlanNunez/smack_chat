//
//  CreateAccountVC.swift
//  smack_chat
//
//  Created by Desarrollo on 1/8/19.
//  Copyright © 2019 Dev Core. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
