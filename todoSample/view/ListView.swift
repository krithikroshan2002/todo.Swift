//
//  ListView.swift
//  todoSample
//
//  Created by Krithik Roshan on 17/08/23.
//

import SwiftUI

struct ListView: View {
    
    @State var textField:String = ""
    @EnvironmentObject var listView: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle : String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack{
            TextField("Enter Your todo ", text: $textField)
                .frame( height: 50)
                .background(Color.mint)
                .cornerRadius(10)
                
            
            Button(
                action: addTodo
                , label: {
                    Text("Add todo")
                        .font(.headline)
                        .frame(height: 50)
                        .background(Color.clear)
                })
            .alert(isPresented: $showAlert, content: getAlert)
            
            List {
                ForEach(listView.todos) { item in
                    ListRowView(todo: item)
                }
            }
        }
    }
    
    func addTodo() {
        if textIsAppropriate() {
            listView.addTodo(title: textField)
            textField = ""
            presentationMode.wrappedValue.dismiss()
        }
    }

    func textIsAppropriate() -> Bool {
        if textField.isEmpty {
            alertTitle = "Enter a valid todo"
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


