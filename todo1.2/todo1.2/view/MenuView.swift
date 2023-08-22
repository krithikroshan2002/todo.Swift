//
//  MenuView.swift
//  todo1.2
//
//  Created by Krithik Roshan on 18/08/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var textField:String = ""
    @EnvironmentObject var listView: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle : String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Menu")
                    .font(.title)
                    .foregroundColor(.black)
            }
            TextField("Enter Your Project", text: $textField)
                .frame(width: 250 , height: 50)
                .background(Color.mint)
                .cornerRadius(10)
            
            Button(
                action: addTodo
                , label: {
                    Text("Add Project")
                        .font(.headline)
                        .frame(height: 50)
                        .background(Color.clear)
                })
            .alert(isPresented: $showAlert, content: getAlert)
            
            List {
                ForEach(listView.projects) { item in
                    NavigationLink(destination: TodoView(parentId: item.id)) {
                        ListRowView(project: item)
                    }
                }
            }
            Spacer()
            
        }.frame(width: 300)
            .edgesIgnoringSafeArea(.trailing)
            .foregroundColor(Color.black)
    }
    
    func addTodo() {
        if textIsAppropriate() {
            listView.addProject(title: textField)
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


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView()
                .environmentObject(ListViewModel())
        }
    }
}

