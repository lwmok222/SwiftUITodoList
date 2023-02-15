//
//  SwiftUITodoListApp.swift
//  SwiftUITodoList
//
//  Created by Eric Mok on 16/11/2022.
//

import SwiftUI

@main
struct SwiftUITodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
