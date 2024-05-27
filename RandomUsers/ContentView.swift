//
//  ContentView.swift
//  RandomUsers
//
//  Created by Sarina on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Sarina!")
            UsersView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
