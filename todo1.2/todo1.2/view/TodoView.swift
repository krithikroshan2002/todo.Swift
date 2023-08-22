//
//  TodoView.swift
//  todo1.2
//
//  Created by Krithik Roshan on 18/08/23.
//

import SwiftUI

struct TodoView: View {
    @State var parentId: String
    @State private var searchText = ""
    @State var isSearchBarVisible = false
    @State var selectedStatus = "1"
    @EnvironmentObject var listView: TodoViewModel
    
    var body: some View {
        VStack{
            NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        if isSearchBarVisible {
                            SearchBar(text: $searchText)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                        } else {
                            Button(action: {
                                isSearchBarVisible.toggle()
                            }) {
                                Image(systemName: "magnifyingglass")
                            }
                            .padding(.trailing, 20)
                        }
                        
                        Picker(selection: $selectedStatus) {
                            Text("status").tag("1")
                            Text("completed").tag("2")
                            Text("uncompleted").tag("3")
                        } label: {
                            HStack{
                                Text("picker")
                                Text(selectedStatus)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .padding(.horizontal)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(.horizontal)
                    }
                    AddTodoView(parentId: parentId)
                    
                    List {
                        ForEach(filteredItems) { item in
                            TodoRowView(todo: item)
                        }
                    }
                    .padding()
                    .onChange(of: selectedStatus) { _ in
                        onChangeStatus()
                    }
                    
                }
            }
            Spacer()
            
            var filteredItems: [Todo] {
                if searchText.isEmpty {
                    return listView.todos.filter { $0.parentId == parentId }
                } else if selectedStatus != "1" {
                    return filterResult
                }
                else {
                    return searchResults.filter { $0.parentId == parentId }
                }
            }
            var searchResults: [Todo] {
                return listView.todos.filter { $0.title.lowercased().contains(searchText.lowercased()) }
            }
            
            var filterResult : [Todo] {
                var filteredData = [Todo]()
                for todos in searchResults {
                    if (selectedStatus == "2") {
                        if(todos.isCompleted == true) {
                            filteredData.append(todos)
                        }
                    } else if (selectedStatus == "3") {
                        if (todos.isCompleted == false) {
                            filteredData.append(todos)
                        }
                    } else {
                        filteredData.append(todos)
                    }
                }
                return filteredData
            }
        }
        
    }
    func onChangeStatus() {
        
    }
}


struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()).frame(maxWidth: .infinity)
            Spacer()
        }
        .padding(.horizontal)
    }
}


struct TodoView_Previews: PreviewProvider {
    var parentId:String
    static var previews: some View {
        AppView()
            .environmentObject(TodoViewModel())
    }
}

