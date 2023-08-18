//
//  ListViewController.swift
//  todoSample
//
//  Created by Krithik Roshan on 17/08/23.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var todos :[Todo] = []
    
    func removeTodo(todo:Todo) {
        if let index = todos.firstIndex(where: {$0.id == todo.id}) {
            todos.remove(at: index)
        }
    }
    
    func addTodo(title:String) {
       let Items = Todo(title: title, isCompleted: false)
        todos.append(Items)
    }
    
}
