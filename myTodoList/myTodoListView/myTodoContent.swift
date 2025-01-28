//
//  myTodoContent.swift
//  myTodoList
//
//  Created by Влад Варламов on 24.01.2025.
//

import SwiftUI

struct myTodoContent: View {
    
    @EnvironmentObject var listViewModel: myListViewModel       //Добавляем эту переменную для связывания с моделью. И теперь мы будем брать все данные из модели.
    
   //Вся логика находиться на отдельной странице myListViewModel()
    
    var body: some View {
        ZStack{
            if listViewModel.todoItems.isEmpty {
                myNoItemView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.todoItems) { item in
                        myTodoDetail(titel: item)
                            .onTapGesture {
                                withAnimation(.bouncy) {
                                    listViewModel.chenge(chengeItem: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItems)
                    .onMove(perform: listViewModel.moveItems)
                }
            }
        } 
        .navigationTitle(Text("My Todo List"))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    myAddView()
                }
            }
        }
    }
    
    
    
}

#Preview {
    NavigationStack{
        myTodoContent()
    }
    .environmentObject(myListViewModel())       //Без этой строчки приложение крашнется
}


