//
//  ProfileView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: Profile View shows the user's profile.

import SwiftUI

struct ProfileView: View {
    @State var testUser: UserTest = UserTest(id: UUID(), userName: "Charry", userAccount: "charrylee0426", userPassword: "123456", userGender: 1, userDescription: "2233", userAvatar: 45.3)
    @State var isEdit: Bool = false
    @Binding var isLogined: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Avatar()
                        .frame(width: 300, height: 300)
                        .scaleEffect(1.0 / 3.0)
                        .frame(width: 100, height: 100)
                        .hueRotation(Angle(degrees: testUser.userAvatar))
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(testUser.userName)
                                .font(.title)
                                .bold()
                            if testUser.userGender == 1 {
                                Text("🚹")
                            } else {
                                Text("🚺")
                            }
                        }
                        Text(testUser.userAccount)
                            .font(.footnote)
                    }
                    .padding(.top, -30)
                    Spacer()
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.secondary)
                    
                    if testUser.userDescription == "" {
                        Text("It seems that you haven't set some description...")
                    } else {
                        Text(testUser.userDescription)
                            .frame(minHeight: 20)
                    }
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        #if os(iOS)
                        withAnimation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5)) {
                            isLogined.toggle()
                        }
                        #endif
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(.red)
                            .bold()
                            .frame(width: 200)
                            .font(.title2)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Profile")
            .toolbar {
                Button {
                    // open the edit view
                    isEdit.toggle()
                } label: {
                    Text("Edit")
                }
                .sheet(isPresented: $isEdit) {
                        ProfileEditView()
                }
            }
        }
        .offset(x: isLogined ? 0 : 2000)
        .navigationViewStyle(.stack)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isLogined: .constant(true))
    }
}
