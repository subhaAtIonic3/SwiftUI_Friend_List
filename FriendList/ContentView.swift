//
//  ContentView.swift
//  FriendList
//
//  Created by Subhrajyoti Chakraborty on 09/08/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userList = ListData()
    
    func getData() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Some error \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedData = try? JSONDecoder().decode([User].self, from: data) {
                print("Successfully decoded data")
                print("Total user => \(decodedData.count)")
                DispatchQueue.main.async {
                    self.userList.listData = decodedData
                    print(self.userList.listData.count)
                }
            } else {
                print("Unable to decode data")
            }
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userList.listData) { user in
                    NavigationLink(destination: DetailView(userData: user, allUsers: self.userList)) {
                        Text("\(user.name)")
                    }
                }
            }
            .navigationBarTitle("Friend List")
        }
        .onAppear(perform: getData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ListData: ObservableObject {
    @Published var listData = [User]()
}
