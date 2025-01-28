//
//  myAddView.swift
//  myTodoList
//
//  Created by Влад Варламов on 24.01.2025.
//

import SwiftUI

struct myAddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: myListViewModel
    @State var textTextFild: String = ""
    
    //Alert
    @State var titelAlert: String = "Enter more than three characters"
    @State var messageAlert: String = "You entered less than three characters in the field!"
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            TextField("Your Todo", text: $textTextFild)
                .padding()
                .frame(height: 50)
                .font(.headline)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
            Button {
                saveTodo()
            } label: {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
            }

        }
        .navigationTitle(Text("Add Todo"))
        .alert(titelAlert, isPresented: $showAlert) {
            
        } message: {
            Text(messageAlert)
        }

    }
    func saveTodo() {
        if textFildApropried() {
            listViewModel.addNewItem(text: textTextFild)    //При нажатии на кнопку, будет вызываться listViewModel, связання с функцией addNewItem и добавлением в нее значения переменной textTextFild
            dismiss()
        }
    }
    
    //Функция для проверки количества символов в текстовом поле
    func textFildApropried() -> Bool {
        if textTextFild.count < 3 {
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationStack{
        myAddView()
    }
    .environmentObject(myListViewModel())
}
