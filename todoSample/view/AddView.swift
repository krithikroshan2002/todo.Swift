//
//  AddView.swift
//  todoSample
//
//  Created by Krithik Roshan on 17/08/23.
//

import SwiftUI

struct AddView: View {
    
    @State var textField:String = ""
    @EnvironmentObject var listView: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle : String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
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
            } .padding(20)
        } .navigationTitle("Todo")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    func addTodo() {
        if textIsAppropriate() {
            listView.addTodo(title: textField)
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

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
