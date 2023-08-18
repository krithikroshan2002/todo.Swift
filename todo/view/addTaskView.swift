//
//  addTaskView.swift
//  todo
//
//  Created by Krithik Roshan on 16/08/23.
//

import SwiftUI

struct addTaskView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("create a new task").font(.todotitle).bold()
            TextField("Enter Your todo", text: title).textFieldStyle(.roundedBorder)
            Button {
                print("task added") }label : {
                    Text("add Task")
        }
        })
    }
}

#Preview {
    addTaskView()
}
