//
//  UserData.swift
//  RandomUsers
//
//  Created by Sarina on 5/26/24.
//

import Foundation

class UserData {
    var users: String = ""
    
    init() async {
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
