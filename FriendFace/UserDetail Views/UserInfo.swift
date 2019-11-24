//
//  UserInfo.swift
//  FriendFace
//
//  Created by Stewart Lynch on 11/23/19.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import SwiftUI


struct UserInfo: View {
    var user:User1
   var body: some View {
    VStack {
        Group {
            TableRow(title: "Name", detail: user.wrappedName).font(.title)
            TableRow(title: "Age", detail: String(user.age))
            TableRow(title: "Company", detail: user.wrappedCompany)
            TableRow(title: "Email", detail: user.wrappedEmail)
            TableRow(title: "Address", detail: user.wrappedAddress)
        }.background(Color.blue)
        Text("\(user.wrappedAbout)").padding(.top).font(.caption)
    }
    }
}

//struct UserInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        UserInfo()
//    }
//}
