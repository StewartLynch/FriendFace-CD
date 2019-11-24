//
//  Friend1+CoreDataProperties.swift
//  FriendFace
//
//  Created by Stewart Lynch on 11/23/19.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend1 {
    
// NOTE:  Since I am using the FriendFaceViewModel instance to manage my data, I am commenting this out and using a static class function to retrieve the fetchRequest.
    // See the static function getRequest() below

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend1> {
//        return NSFetchRequest<Friend1>(entityName: "Friend1")
//    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: NSSet?
    
    // MARK: Computed properties to deal with optionals
    
    public var wrappedId: String {
        id ?? "Unknown id"
    }
    
    public var wrappedName: String {
        name ?? "unknown name"
    }
    
    public var userArray: [User1] {
        let set = origin as? Set<User1> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    // MARK: Static fetchRequest for this entity
    static func getRequest() -> NSFetchRequest<Friend1> {
        let request: NSFetchRequest<Friend1> = Friend1.fetchRequest() as! NSFetchRequest<Friend1>
        return request
    }

}

// MARK: Generated accessors for origin
extension Friend1 {

    @objc(addOriginObject:)
    @NSManaged public func addToOrigin(_ value: User1)

    @objc(removeOriginObject:)
    @NSManaged public func removeFromOrigin(_ value: User1)

    @objc(addOrigin:)
    @NSManaged public func addToOrigin(_ values: NSSet)

    @objc(removeOrigin:)
    @NSManaged public func removeFromOrigin(_ values: NSSet)

}
