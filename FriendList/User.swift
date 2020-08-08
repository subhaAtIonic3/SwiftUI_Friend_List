//
//  User.swift
//  FriendList
//
//  Created by Subhrajyoti Chakraborty on 09/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import Foundation


struct User: Identifiable, Codable {
    
    let id: String
    let name: String
    let email: String
    let address: String
    let about: String
    let friends: [Friend]
}

struct Friend: Identifiable, Codable {
    let id: String
    let name: String
}
