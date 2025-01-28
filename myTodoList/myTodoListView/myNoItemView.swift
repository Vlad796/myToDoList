//
//  myNoItemView.swift
//  myTodoList
//
//  Created by Влад Варламов on 27.01.2025.
//

import SwiftUI

struct myNoItemView: View {
    
    @State var animate = false
    let seconderyColor = Color("SeconderyColor")
    
    var body: some View {
        ScrollView {
            VStack{
                Text ("There are not item")
                    .font(.title)
                    .foregroundStyle(.secondary)
                Text ("Do you want to add a new item? Click on the Add or Add a new item button")
                    .foregroundStyle(.secondary)
                NavigationLink {
                    myAddView()
                } label: {
                    Text("Add a new item")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background( animate ? seconderyColor : Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
                .shadow(color: animate ? seconderyColor : Color.accentColor,
                        radius: 10,
                        y: 5
                )

            }
            .frame(maxWidth: 450)
            .padding()
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .navigationTitle(Text("No item"))
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 2)
                .repeatForever()) {
                    animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        myNoItemView()
    }
    
}
