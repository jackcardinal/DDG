//
//  ProfileView.swift
//  DDG
//
//  Created by Jack Cardinal on 8/19/22.
//

import SwiftUI
import CloudKit

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var profile: Profile
    
    var body: some View {
        
        ZStack {
            VStack {
                ZStack {
                    NameBackgroundView()
                    HStack (spacing: 16) {
                        ZStack {
                            AvatarView(image: viewModel.avatar, size: 84)
                            EditImage()
                        }
                        .padding(.leading, 12)
                        .onTapGesture { viewModel.isShowingPhotoPicker = true }

                        VStack(spacing: 1) {
                            TextField("First Name", text: $viewModel.firstName).profileNameStyle()
                            TextField("Last Name", text: $viewModel.lastName).profileNameStyle()
                            TextField("Tagline", text: $viewModel.tagline)
                        }
                        .padding(.trailing, 16)
                    }
                    .padding()

                }
                VStack (alignment: .leading) {
                    CharactersRemainView(currentCount: viewModel.bioText.count)
                    
                    TextEditor(text: $viewModel.bioText)
                        .frame(height: 100)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1))
                }
                .padding(.horizontal, 20)
                Spacer()
                
                Button {
                    viewModel.createProfile()
                } label: {
                    DDGButton(btnText: "Create Profile")
                }
                .padding(.bottom, 5)

            }
            if viewModel.isLoading {
                LoadingView()
            }
                
        }
        .navigationTitle("Profile")
        .toolbar {
            Button {
                dismissKeyboard()
            }
            label: {
                Image(systemName: "keyboard.chevron.compact.down")
            }
        }
        .onAppear { viewModel.getProfile() }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .sheet(isPresented: $viewModel.isShowingPhotoPicker) {
            PhotoPicker(image: $viewModel.avatar)
        }

    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profile: MockGrubSpotData.sampleProfile)
        }
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






