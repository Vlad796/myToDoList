//
//  myTodoDetail.swift
//  myTodoList
//
//  Created by Влад Варламов on 24.01.2025.
//

import SwiftUI

struct myTodoDetail: View {
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text("This if my first text")
            Spacer()
        }
    }
}

#Preview {
    
    
    NavigationStack{
        myTodoDetail()
    }
}
