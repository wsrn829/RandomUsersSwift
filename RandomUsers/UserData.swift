//
//  UserData.swift
//  RandomUsers
//
//  Created by Sarina on 5/26/24.
//

import Foundation
import SwiftUI

@MainActor
class UserData: ObservableObject {
    @Published var users: String = ""
    
    init() {
        Task {
            await loadUsers()
        }
        
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
        }
        catch {
            print(error)
        }
    }
}

struct UsersView: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Raw JSON Data:")
                ScrollView {
                    Text(userData.users)
                }
            }
            .padding()
            .navigationTitle("Random Users")
    }
    
    }
}
