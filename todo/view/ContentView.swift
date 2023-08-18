//
//  ContentView.swift
//  todo
//
//  Created by Krithik Roshan on 16/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("My Task").bold()
        }
        .padding()
        .frame(width: .infinity, height: .infinity)
        .background(Color.blue)
    }
}

#Preview {
    ContentView()
}
