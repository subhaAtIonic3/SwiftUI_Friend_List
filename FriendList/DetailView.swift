//
//  DetailView.swift
//  FriendList
//
//  Created by Subhrajyoti Chakraborty on 09/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let userData: User
    @ObservedObject var allUsers: ListData
    
    var body: some View {
        VStack {
            Text("\(userData.name)")
            Text("\(userData.email)")
            Text("\(userData.address)")
            Text("\(userData.about)")
            
            ForEach(userData.friends) { friend in
                NavigationLink(destination: FriendDetailView(data: friend, allUsers: self.allUsers)) {
                    Text("\(friend.name)")
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .navigationBarTitle("\(userData.name)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userData: User(id: "1", name: "Test", email: "test@test.com", address: "test add", about: "test about", friends: [Friend(id: "1.1", name: "test friend 1"), Friend(id: "1.2", name: "test friend 2")]), allUsers: ListData())
    }
}

