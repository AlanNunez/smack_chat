//
//  MessageCell.swift
//  smack_chat
//
//  Created by Desarrollo on 1/17/19.
//  Copyright © 2019 Dev Core. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(message: Message) {
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
        guard let isoDate = message.timeStamp else { return }
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5)
        let subs = isoDate[end...]
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: subs.appending("Z"))
        
        let newFormmatter = DateFormatter()
        newFormmatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate {
            let finalDate = newFormmatter.string(from: finalDate)
            timeStampLbl.text = finalDate
        }
    }
}
