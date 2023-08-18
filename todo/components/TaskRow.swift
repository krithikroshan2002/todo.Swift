//
//  TaskRow.swift
//  todo
//
//  Created by Krithik Roshan on 16/08/23.
//

import SwiftUI
    
struct TaskRow: View {
    var task : String
    var completed : Bool
    var body: some View {
        HStack(spacing: 20, content: {
            Image(systemName: completed ? "checkmark.circle":"circle"
            )
            Text(task)
        })
    }
}

#Preview {
    TaskRow(task: "do clean rooms", completed: true)
}
