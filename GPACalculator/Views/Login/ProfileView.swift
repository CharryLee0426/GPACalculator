//
//  ProfileView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: Profile View shows the user's profile.

import SwiftUI

struct ProfileView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @State var user: FetchedResults<User>.Element?
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
                        .hueRotation(Angle(degrees: user!.useravatar))
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(user!.username!)
                                .font(.title)
                                .bold()
                            if user!.usergender == 1 {
                                Text("🚹")
                            } else {
                                Text("🚺")
                            }
                        }
                        Text(user!.useraccount!)
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
                    
                    if user!.userdescription! == "" {
                        Text("It seems that you haven't set some description...")
                    } else {
                        Text(user!.userdescription!)
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
                        ProfileEditView(isEdit: $isEdit, user: user!)
                }
            }
        }
        .offset(x: isLogined ? 0 : 2000)
        .navigationViewStyle(.stack)
    }
}
