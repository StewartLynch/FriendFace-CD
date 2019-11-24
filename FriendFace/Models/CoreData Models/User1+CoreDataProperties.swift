//
//  User1+CoreDataProperties.swift
//  FriendFace
//
//  Created by Stewart Lynch on 11/23/19.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftUI


extension User1 {

// NOTE:  Since I am using the FriendFaceViewModel instance to manage my data, I am commenting this out and using a static class function to retrieve the fetchRequest.
    // See the static function getRequest() below
    
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<User1> {
//        return NSFetchRequest<User1>(entityName: "User1")
//    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var friend: NSSet?
    
    
    // MARK: Computed properties to deal with optionals

    public var wrappedId: String {
          id ?? "Unknown id"
      }
      
      public var wrappedName: String {
          name ?? "Unknown Name"
      }
      
      public var wrappedCompany: String {
          company ?? "Unknown Company"
      }
      
      public var wrappedEmail: String {
          email ?? "Unknown email"
      }
      
      public var wrappedAddress: String {
          address ?? "Unknown address"
      }
      
      public var wrappedAbout: String {
          about ?? ""
      }
      
      public var wrappedRegistered: String {
          registered ?? ""
      }
      
      public var friendArray: [Friend1] {
          let set = friend as? Set<Friend1> ?? []
          return set.sorted {
              $0.wrappedName < $1.wrappedName
          }
      }
      
      // MARK: - Presentation computed views
      var activeImage: some View {
          return Image(systemName: isActive ? "person.crop.circle.fill.badge.checkmark" : "exclamationmark.triangle.fill")
              .foregroundColor(isActive ? .green : .red)
      }
      
      var isActiveLabel: some View {
          return HStack {
              activeImage
              Text(isActive ?  "Active since \(displayDate)" : "Inactive")
          }.font(.title)
      }
      
      // MARK: - Presentation computed value
      var displayDate: String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
          let date = dateFormatter.date(from: wrappedRegistered)
          dateFormatter.dateStyle = .medium
          return dateFormatter.string(from: date!)
      }
      
    // MARK: Static fetchRequest for this entity
      static func getRequest() -> NSFetchRequest<User1> {
          let request: NSFetchRequest<User1> = User1.fetchRequest() as! NSFetchRequest<User1>
          return request
      }
}

// MARK: Generated accessors for friend
extension User1 {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: Friend1)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: Friend1)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}
