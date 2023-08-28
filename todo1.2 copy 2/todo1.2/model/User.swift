//
//  User.swift
//  todo1.2
//
//  Created by Krithik Roshan on 25/08/23.
//

import Foundation

class User : Identifiable {
    let id:String
    var name:String
    var description:String
    
    init(id: String, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(name:String) {
        self.name =  name
    }
    
    func getId() -> String {
        return id
    }
    
    func getDescription() -> String {
        return description
    }
    
    func setDescription(description:String) {
        self.description = description
    }
}
