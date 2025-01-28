//
//  myTodoListApp.swift
//  myTodoList
//
//  Created by Влад Варламов on 24.01.2025.
//

import SwiftUI

@main
struct myTodoListApp: App {
    
    @StateObject var listViewModel: myListViewModel = myListViewModel()     //Добавляем переменную для того что бы ViewModel распростронялась на все страницы
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                myTodoContent()
            }
            .environmentObject(listViewModel)     //Теперь все модели имеют доступ к ViewModel
        }
    }
}
