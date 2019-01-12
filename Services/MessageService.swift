//
//  File.swift
//  smack_chat
//
//  Created by Alan Nunez on 11/01/2019.
//  Copyright © 2019 Dev Core. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return}
                print("data", data)
                do {
                    
                    if let json = try JSON(data: data).array {
                        print("JSON", json)
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            
                            print(name, channelDescription, id)
                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                         completion(true)
                    }
                   
                }
                catch {}
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
}
