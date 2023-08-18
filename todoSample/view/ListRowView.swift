//
//  ListRowView.swift
//  todoSample
//
//  Created by Krithik Roshan on 17/08/23.
//

import SwiftUI

struct ListRowView : View {
    @State var todo : Todo;
    @EnvironmentObject var listView:ListViewModel
    
    var body: some View {
        HStack {
            CheckBox(isChecked: $todo.isCompleted)
                .frame(width: 20, height: 20)
                .padding(10)
            Text(todo.title)
                .foregroundColor(todo.isCompleted ? Color.gray : Color.black)
                .padding(10)
                .frame(width: 240, height: 20)
            Image(systemName: "minus.circle.fill")
                .onTapGesture(perform: remove)
                .frame(width: 20, height: 20)
                .padding(10)
        }
        .font(.title2)
        .padding(.vertical, 10)
        .frame(width: .infinity, height: 50)
    }
    
    func remove() {
        listView.removeTodo(todo:todo)
    }
}

struct CheckBox: View {
    @Binding var isChecked: Bool

    var body: some View {
        Image(systemName: isChecked ? "checkmark.square" : "square")
            .onTapGesture {
                isChecked.toggle()
            }
    }
}

struct ListRowView_Previews: PreviewProvider {

    static var previews: some View {
        ListView()
    }
}
