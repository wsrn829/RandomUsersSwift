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
    @Published var users: [User] = []
    
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
            List(userData.users) { user in
                Text(user.fullName)
            }
            .navigationTitle("Random Users")
    }
    
    }
}
