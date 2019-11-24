//
//  User.swift
//  FriendFace
//
//  Created by Stewart Lynch on 2019-11-21.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


class FriendFaceViewModel: ObservableObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @Published var users1:[User1] = []
    @Published var isLoaded = false
    
    init() {
        // When the instance is created on contentView, this initializer is called.
        getData()
    }
    
    func getData() {
        let request = User1.getRequest()
        let friendRequest = Friend1.getRequest()
        do {
            // First fetch the data from Core Data
            let users1 = try context.fetch(request)
            var friends1 = try context.fetch(friendRequest)
            if users1.count == 0 {
                // This must be first launch so fetch create a temporary array of User to store data
                var users:[User] = []
                // Fetch Data
                Network.getUsers(from: "https://www.hackingwithswift.com/samples/friendface.json") { (result, error) in
                    if let err = error {
                        print("Error \(err.localizedDescription)")
                    }
                    // Now that th data has been received, populate the Core Data entities
                    DispatchQueue.main.async {
                        users = result ?? []
                        // Every user will be new, so add to the User1 entity
                        for user in users {
                            let newUser = User1(context: self.context)
                            newUser.id = user.id
                            newUser.isActive = user.isActive
                            newUser.name = user.name
                            newUser.email = user.email
                            newUser.age = Int16(user.age)
                            newUser.company = user.company
                            newUser.address = user.address
                            newUser.about = user.about
                            newUser.registered = user.registered
                            do {
                                try self.context.save()
                                
                            } catch {
                                print(error.localizedDescription)
                            }
                            // Now check through the fetched user.friends array checking for friends
                            for friend in user.friends {
                                if let foundFriend = (friends1.filter{$0.id == friend.id}).first {
                                    // the freiend has alredy been added to the friends1 array so just set up the relationship
                                    newUser.addToFriend(foundFriend)
                                } else {
                                    // The friend does not yet exist so create it and add to the friends1 array AND set up the relationship
                                    let newFriend = Friend1(context: self.context)
                                    newFriend.id = friend.id
                                    newFriend.name = friend.name
                                    newUser.addToFriend(newFriend)
                                    friends1.append(newFriend)
                                }
                                do {
                                    try self.context.save()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                            // Add the user to the users1 array (it also contains all of the related friend connections
                            self.users1.append(newUser)
                        }
                        // This will pass back to the contentview the fact that the data has been loaded and will
                        // display the data
                        self.isLoaded = true
                    }
                }
            } else {
                // This will pass back to the contentview the fact that the data has been loaded and will
                // display the data
                self.users1 = users1
                self.isLoaded = true
            }
        } catch {
            print("error fetching data from coredata")
        }
    }
}
