//
//  myTodoDetail.swift
//  myTodoList
//
//  Created by Влад Варламов on 24.01.2025.
//

import SwiftUI

struct myTodoDetail: View {
    
    @State var titel: myTodoModel
    
    var body: some View {
        HStack{
            Image(systemName: titel.isDone ? "checkmark.circle" : "circle" )
//                .onTapGesture {
//                    withAnimation(.bouncy) {
//                        titel.isDone.toggle()
//                    }
//                }
            Text(titel.text)
            Spacer()
        }
    }
}

#Preview {
    
    let item1 = myTodoModel(text: "one", isDone: true)
    let item2 = myTodoModel(text: "two", isDone: false)
    
    NavigationStack{
        Group{
            myTodoDetail(titel: item1)
            myTodoDetail(titel: item2)
        }
    }
}
