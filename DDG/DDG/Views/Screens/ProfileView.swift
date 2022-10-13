//
//  ProfileView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI

struct ProfileView: View {
    
    var profile: Profile
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var tagline = ""
    @State private var bioText = "This is a sample bio"
    
    var body: some View {
        
        VStack {
            ZStack {
                NameBackgroundView()
                HStack (spacing: 16) {
                    ZStack {
                        AvatarView(size: 84)
                        EditImage()
                    }
                    .padding(.leading, 12)

                    VStack(spacing: 1) {
                        TextField("First Name", text: $firstName)
                            .profileNameStyle()
                        TextField("Last Name", text: $lastName)
                            .profileNameStyle()
                        TextField("Tagline", text: $tagline)
                    }
                    .padding(.trailing, 16)
                }
                .padding()

            }
            VStack (alignment: .leading) {
                CharactersRemainView(currentCount: bioText.count)
                    
//                    Spacer()
//                    Button {
//
//                    }
//
//                label: {
//                    Label("Check Out", systemImage: "mappin.and.ellipse")
//                }
//                .buttonStyle(.bordered)
//                .foregroundColor(.white)
//                .background(Color.red)
//                .cornerRadius(10)
//                .padding(.trailing)
                
                TextEditor(text: $bioText)
                    .frame(height: 100)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            }
            .padding(.horizontal, 20)
            Spacer()
            
            Button {
                
            } label: {
                DDGButton(btnText: "Create Profile")
            }

        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profile: MockData.sampleProfile)
        }
    }
}


struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.small)
    }
}

struct EditImage: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .foregroundColor(.white)
            .offset(y: 30)
    }
}

struct NameBackgroundView: View {
    var body: some View {
        Color(.secondarySystemBackground)
            .frame(height: 130)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}

struct CharactersRemainView: View {
    
    var currentCount: Int
    
    var body: some View {
        Text("Bio: ")
            .font(.callout)
            .foregroundColor(.secondary)
        +
        Text("\(100 - currentCount) ")
            .bold()
            .font(.callout)
            .foregroundColor(currentCount <= 100 ? .brandPrimary : Color(.systemPink))
        +
        Text("characters remain")
            .font(.callout)
            .foregroundColor(.secondary)
    }
}






