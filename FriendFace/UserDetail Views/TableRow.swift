//
//  TableRow.swift
//  FriendFace
//
//  Created by Stewart Lynch on 11/22/19.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct TableRow: View {
    var title:String
    var detail: String
    var body: some View {
            HStack(alignment: .top) {
                Text(self.title)
                    .frame(width: 80, alignment: .trailing)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                Text(self.detail)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.6))
                    .foregroundColor(.white)
            }
    }
    
}

struct TableRow_Previews: PreviewProvider {
    static var previews: some View {
        TableRow(title: "Name", detail: "Stewart Lynch")
    }
}
