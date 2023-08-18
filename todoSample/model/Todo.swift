//
//  Todo.swift
//  todoSample
//
//  Created by Krithik Roshan on 17/08/23.
//

import Foundation

struct Todo : Identifiable{
    let id : String
    let title : String
    var isCompleted : Bool
    
    init(id:String = UUID().uuidString, title:String, isCompleted:Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}

