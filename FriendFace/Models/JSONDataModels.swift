//
//  DataModels.swift
//  FriendFace
//
//  Created by Stewart Lynch on 11/22/19.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import Foundation
import SwiftUI

/* Normally I woudld create two different files as these are two different structs,
  However, since the User struct contains an array of Friends, they are closely
 coupled so I am keeping them in the same file for easy reference
 */

struct User: Identifiable, Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about:String
    let registered:String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Identifiable, Codable {
    let id: String
    let name: String
}
