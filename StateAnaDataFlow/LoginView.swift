//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserSettings
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Text(name.count.formatted())
                    .foregroundColor(name.count < 3 ? .red : .green)
            }
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
    
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


