//
//  FriendDetailView.swift
//  FriendList
//
//  Created by Subhrajyoti Chakraborty on 09/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct FriendDetailView: View {
    var data: Friend
    @State var user = User(id: "", name: "", email: "", address: "", about: "", friends: [])
    @ObservedObject var allUsers: ListData
    
    func getUserDetails() {
        let userData = allUsers.listData.filter {
            return $0.id == data.id
        }.first
        
        if let safeUserData = userData {
            user = safeUserData
        } else {
            print("Unable to get user")
        }
    }
    
    var body: some View {
        VStack {
            Text("\(user.name)")
            Text("\(user.email)")
            Text("\(user.address)")
            Text("\(user.about)")
        }
        .navigationBarTitle("\(data.name)")
        .onAppear(perform: getUserDetails)
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(data: Friend(id: "1", name: "Test"), allUsers: ListData())
    }
}
