//
//  ContentView.swift
//  FriendFace
//
//  Created by Stewart Lynch on 2019-11-21.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var ffVM = FriendFaceViewModel()
    @State var degrees:Double = 360
    @State private var isActive = false
    var body: some View {
       NavigationView {
            // If the data is loading from JSON, and is  not yet loaded, display the loading screen
            if ffVM.isLoaded {
            List {
                
                ForEach(ffVM.users1.sorted{$0.wrappedName < $1.wrappedName}) { user in
                    if user.isActive || !self.isActive {
                        NavigationLink(destination: UserDetailView(user: user, users:self.ffVM.users1)) {
                        VStack(alignment: .leading) {
                            HStack {
                                user.activeImage
                                Text("\(user.wrappedName)")
                            }.font(.title)
                            Text(user.wrappedEmail)
                                .foregroundColor(.blue)
                            Text("Has \(user.friendArray.count) friends")
                        }
                    }
                }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.isActive.toggle()
            }, label: {
                Text(self.isActive ? "Active" : "All")
            }))
            .navigationBarTitle("FriendFace")
            
            } else {
                LoadingView(degrees: $degrees)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


