//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Stewart Lynch on 2019-11-21.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    var user:User1
    var users:[User1]
    @State var showUser:Bool = false
    @State var selectedUser:User1? = nil
    var body: some View {
        VStack(alignment: .leading) {
            user.isActiveLabel
            UserInfo(user: user)
            
            Text("Friends")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .background(Color.secondary)
                .foregroundColor(.white)
            List {
                ForEach(user.friendArray.sorted {$0.wrappedName < $1.wrappedName}) { friend in
                    Text(friend.wrappedName)
                        .onTapGesture {
                            self.selectedUser = self.users.first {$0.id == friend.id}
                            self.showUser.toggle()
                    }
                }
            }.sheet(isPresented: $showUser) {
                UserInfo(user:self.selectedUser!).padding(.top)
                Spacer()
            }
        }.padding()
            .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var user = FriendFaceViewModel().users1[0]
    static var previews: some View {
        UserDetailView(user: user, users: [])
        
    }
}



