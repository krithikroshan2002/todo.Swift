//
//  TodoRowView.swift
//  todo1.2
//
//  Created by Krithik Roshan on 18/08/23.
//

import SwiftUI

struct TodoRowView: View {
    @State var todo : Todo;
    @EnvironmentObject var todoView:TodoViewModel
    
    var body: some View {
        HStack {
            CheckBox(isChecked: $todo.isCompleted)
                .frame(width: 20, height: 20)
                .padding(10)
            Text(todo.title)
                .foregroundColor(todo.isCompleted ? Color.gray : Color.black)
                .padding(10)
                .frame(width: 240, height: 20)
            
                .onChange(of: todo.isCompleted){ _ in
                    todoView.onCheckBoxClick(todo: todo)}
            
            Image(systemName: "minus.circle.fill")
                .onTapGesture(perform: remove)
                .frame(width: 20, height: 20)
                .padding(10)
            
            
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
    
    func remove() {
        todoView.removeTodo(todo:todo)
    }
    
}

struct CheckBox: View {
    @Binding var isChecked: Bool
    @EnvironmentObject var listView:ListViewModel
    
    var body: some View {
        VStack {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .onTapGesture {
                    isChecked.toggle()
                }
        }
        
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
