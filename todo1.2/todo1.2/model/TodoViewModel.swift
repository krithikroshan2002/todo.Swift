//
//  TodoViewModel.swift
//  todo1.2
//
//  Created by Krithik Roshan on 18/08/23.
//

import Foundation

class TodoViewModel : ObservableObject {
    @Published var todos :[Todo] = []
    var id = 1
    
    func removeTodo(todo:Todo) {
        if let index = todos.firstIndex(where: {$0.id == todo.id}) {
            todos.remove(at: index)
        }
    }
    
    func addTodo(title:String, parentId:String) {
        var Item = Todo(id: String(id), title: title, isCompleted: false, parentId: parentId)
        id += 1
        todos.append(Item)
    }
    
    func onCheckBoxClick(todo:Todo) {
        if let index = todos.firstIndex(where: {$0.id == todo.id}) {
            todos[index] = todo
        }
    }
    
    func getLables() -> [String] {
        var labels = [String]()
        
        for todo in todos {
            labels.append(todo.title)
        }
        return labels
    }
}
