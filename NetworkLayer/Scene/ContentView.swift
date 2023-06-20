//
//  ContentView.swift
//  NetworkLayer
//
//  Created by Baris on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            
//            //user
//            NetworkManager.shared.getUser { result in
//                switch result {
//                case .success(let success):
//                    success.forEach { user  in
//                        print(user.name)
//                    }
//                case .failure(let failure):
//                    print(failure.localizedDescription)
//                }
//            }
            
            print("------- COMMENTS -------")
            //comments
            NetworkManager.shared.getComments { comment in
                switch comment {
                case .success(let success):
                    success.forEach { comment in
                        print(comment.email)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
