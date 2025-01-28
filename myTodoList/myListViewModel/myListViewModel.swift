//
//  myListViewModel.swift
//  myTodoList
//
//  Created by Влад Варламов on 26.01.2025.
//

import Foundation

class myListViewModel: ObservableObject {
    //Создается массив как и в myTodoContent
    @Published var todoItems: [myTodoModel] = [] {
        didSet {
            saveData()
        }
    }
    let titelKey = "todoItems"
    init() {
        getItem()
    }

//Создаем функцию для init() и добавляем массив в константу. После чего присваиваем эту константу массиву
    func getItem() {
//        let newItem = [
//            myTodoModel(text: "This is my first todo item", isDone: false),
//            myTodoModel(text: "This is my second todo item", isDone: true),
//            myTodoModel(text: "This is my third todo item", isDone: false),
//        ]
//        todoItems.append(contentsOf: newItem)
        
        guard
            let dataUptate = UserDefaults.standard.data(forKey: titelKey),
            let savedItems = try? JSONDecoder().decode([myTodoModel].self, from: dataUptate)
        else { return }
        
        self.todoItems = savedItems
    }
    
//Переносим дополнительные функции для удаления и перемещения
    func deleteItems(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        todoItems.move(fromOffsets: from, toOffset: to)
    }
    
    //Функция для добавления нового элемента в массив
    func addNewItem(text: String) {
        let newItem = myTodoModel(text: text, isDone: false)
        todoItems.append(newItem)
    }
    
    func chenge(chengeItem: myTodoModel) {
        if let items = todoItems.firstIndex(where: { $0.id == chengeItem.id }) {
            todoItems[items] = chengeItem.updeteComplition()
        }
    }
    
    func saveData() {
        /*
            Система настроек по умолчанию позволяет приложению настраивать своё поведение в соответствии с предпочтениями пользователя.
            Например, вы можете разрешить пользователям указывать предпочитаемые единицы измерения или скорость воспроизведения мультимедиа.
            Приложения сохраняют эти настройки, присваивая значения набору параметров в базе данных настроек пользователя.
         
         try? - Принудительно возвращает nil
         */
        UserDefaults.standard.set(try? JSONEncoder().encode(todoItems), forKey: titelKey)
    }
}


