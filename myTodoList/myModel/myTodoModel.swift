//
//  myTodoModel.swift
//  myTodoList
//
//  Created by Влад Варламов on 24.01.2025.
//

import Foundation

struct myTodoModel: Identifiable, Codable {
    let id: String
    let text: String
    let isDone: Bool
    
    init(id: String = UUID().uuidString, text: String, isDone: Bool) {
        self.id = id
        self.text = text
        self.isDone = isDone
    }
    
    func updeteComplition() -> myTodoModel {
        return myTodoModel(id: id, text: text, isDone: !isDone)
    }
}

/*
 id: String = UUID().uuidString
 Если не будет получено значение id с помощью строки, будет генерироваться случайный id
 
 myTodoModel(text: (String), isDone: (Bool)) - будет испоьзоваться при СОЗДАНИИ НОВОГО элемента
 
 myTodoModel(id: (String), text: (String), isDone: (Bool)) - будет использоваться при ОБНОВЛЕНИИ элемента

 */

