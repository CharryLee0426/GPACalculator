//
//  ProfileEditView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//

import SwiftUI

struct ProfileEditView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @Binding var isEdit: Bool
    @State var user: FetchedResults<User>.Element
    @State var userName: String = ""
    @State var userPassword: String = ""
    @State var userDescription: String = ""
    @State var userAvatar: Double = 0.0
    @State var userGender: Int = 0
    @State var isShowPassword: Bool = false
    
    private func edit() {
        if userPassword != "" {
            DataController().editUser(user: user, userName: userName, userPassword: userPassword, userGender: userGender, userAvatar: userAvatar, userDescription: userDescription, context: managedObjContext)
            print("Edit Successfully✅")
            isEdit.toggle()
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("\(user.username!)", text: $userName)
                        .textFieldStyle(.plain)
                        .onAppear {
                            userName = user.username!
                            userDescription = user.userdescription!
                            userAvatar = user.useravatar
                            userGender = Int(user.usergender)
                        }
                } header: {
                        Text("Name")
                            .bold()
                } footer: {
                    Text("It will show at your profile")
                }
                
                Section {
                    ZStack {
                        if isShowPassword {
                            TextField("UserPassword...", text: $userPassword)
                                .textFieldStyle(.plain)
                        } else {
                            SecureField("UserPassword...", text: $userPassword)
                                .textFieldStyle(.plain)
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                // It seems that no animation is the
                                // best solution.
                                isShowPassword.toggle()
                            } label: {
                                Image(systemName: isShowPassword ? "eye.fill" : "eye.slash")
                            }
                        }
                    }
                } header: {
                    Text("Password")
                        .bold()
                }
                
                Section {
                    TextField("Description...", text: $userDescription)
                        .textFieldStyle(.plain)
                } header: {
                        Text("Description")
                            .bold()
                } footer: {
                    Text("Leave what you wanna say...")
                }
                
                Section {
                    Picker("", selection: $userGender) {
                        Text("🚹")
                            .tag(1)
                        Text("🚺")
                            .tag(0)
                    }
                    .pickerStyle(.segmented)
                } header: {
                    HStack {
                        Text("Gender: ")
                        if userGender == 1 {
                            Text("🚹")
                        } else {
                            Text("🚺")
                        }
                    }
                }
                
                Section {
                    VStack(alignment: .center) {
                        HStack {
                            Spacer()
                            
                            Avatar()
                                .frame(width: 300, height: 300)
                                .scaleEffect(1.0 / 3.0)
                                .frame(width: 100, height: 100)
                                .hueRotation(Angle(degrees: userAvatar))
                            
                            Spacer()
                        }
                        Slider(value: $userAvatar, in: 0...360, step: 0.1)
                    }
                } header: {
                    Text("Avatar")
                        .bold()
                } footer: {
                    Text("Drag to personalize your avatar")
                }
                
                Section {
                    HStack{
                        Spacer()
                        
                        Button {
                            edit()
                        } label: {
                            Text("Done")
                        }
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Edit")
            .toolbar {
                Button {
                    isEdit.toggle()
                } label: {
                    VStack {
                        Label("Exit", systemImage: "rectangle.portrait.and.arrow.right")
                        Text("Exit")
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}

//struct ProfileEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEditView(isEdit: .constant(true))
//    }
//}
