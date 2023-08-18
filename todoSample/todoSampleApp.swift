//
//  todoSampleApp.swift
//  todoSample
//
//  Created by Krithik Roshan on 17/08/23.
//

import SwiftUI

@main
struct todoSampleApp: App {
    
    @StateObject var listView: ListViewModel = ListViewModel()
            
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listView)
        }
    }
}
