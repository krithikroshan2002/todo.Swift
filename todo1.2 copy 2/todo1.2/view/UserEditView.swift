//
// Created by Krithik Roshan on 28/08/23.
//

import SwiftUI

struct UserEditView: View {
    @Binding var userName: String
    @Binding var userDescription: String
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Profile")) {
                    VStack {
                        ZStack {
                            Circle()
                                    .frame(width: 120, height: 120, alignment: .centerFirstTextBaseline)
                                    .foregroundColor(.blue)
                                    .padding()

                            Text(userName.prefix(1).uppercased())
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                        }
                        TextField("New Name", text: $userName)
                                .frame(alignment: .center)
                                .padding(.leading, 100)
                                .padding()
                        TextField("New Description", text: $userDescription)

                                .frame(alignment: .center)
                                .padding(.leading, 100)
                                .padding()
                    }

                }

                        Button(action: {
                            UserList().addUser(name: userName, description: userDescription)
                            presentation.wrappedValue.dismiss()
                        }) {
                            Text("Save")
                        }
                                .padding(.leading, 80)
                                .padding()

                        Button(action: {
                            userName = "user"
                            userDescription = "description"
                            presentation.wrappedValue.dismiss()
                        }) {
                            Text("Cancle")
                        }
                                .padding(.leading, 80)
                                .padding()
                    }
                }
            }
        }


