//
//  ChannelVC.swift
//  smack_chat
//
//  Created by Desarrollo on 1/3/19.
//  Copyright © 2019 Dev Core. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @IBAction func prepareForWind(segue: UIStoryboardSegue, sender: Any?) {        
    }
}
