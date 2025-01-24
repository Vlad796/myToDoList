//
//  myTodoContent.swift
//  myTodoList
//
//  Created by Влад Варламов on 24.01.2025.
//

import SwiftUI

struct myTodoContent: View {
    
    @State var todoItems: [String] = [
        "Buy milk",
        "Clean room",
        "Learn SwiftUI",
        "Go for a walk",
    ]
    
    var body: some View {
            List {
                ForEach(todoItems, id: \.self) { item in
                    myTodoDetail()
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
        .navigationTitle(Text("My Todo List"))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    Text("Detail")
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        todoItems.move(fromOffsets: from, toOffset: to)
    }
    
}

#Preview {
    NavigationStack{
        myTodoContent()
    }
}


