//
//  Constants.swift
//  smack_chat
//
//  Created by Alan Nunez on 1/5/19.
//  Copyright © 2019 Dev Core. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Sucess: Bool) -> ()

//URL Constants
let BASE_URL = "https://smack-app-host.herokuapp.com/v1/"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
