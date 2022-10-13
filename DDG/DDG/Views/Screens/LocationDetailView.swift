//
//  LocationDetailView.swift
//  DDG
//
//  Created by Jack Cardinal on 9/16/22.
//

import SwiftUI

struct LocationDetailView: View {
    
    var buttons = ["location","webURL", "phone", "contact"]
    let btnImage = ["location.fill", "network", "phone.fill", "person.fill.xmark"]
    //    let btnColumns: [GridItem] = [GridItem(.fixed(90)), GridItem(.fixed(90)), GridItem(.fixed(90)), GridItem(.fixed(90))]
    let avatarColumns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let bio = "This is a very long bio that probably needs to be checked so that it isn't too long."
    
    var body: some View {
        VStack (spacing: 16) {
            BannerImageView(imageName: "default-banner-asset")
            HStack {
                Label("Address of location", systemImage: "mappin.and.ellipse")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.leading)
                Spacer()
            }
            BioTextView(bioText: "This is a big bio, and this is a big bio, and this is a big bio, and this is a big bio, and this is a big bio, and this is a big bio, and this is a big bio.")
            ZStack {
                Capsule()
                    .frame(height: 80, alignment: .center)
                    .foregroundColor(Color(.secondarySystemBackground))
                HStack (spacing: 20) {
                    Button {
                        
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: btnImage[0])
                    }
                    
                    Button {
                        
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: btnImage[1])
                    }
                    
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        LocationActionButton(color: .brandPrimary, imageName: btnImage[2])
                    })
                    
                    Button {
                        
                    } label: {
                        LocationActionButton(color: .red, imageName: btnImage[3])
                    }
                    
                }
                //                HStack(spacing: 25) {
                //                    ForEach((btnImage), id: \.self ) { img in
                //                        Button {
                //                            print("tap")
                //                        } label: {
                //                            Image(systemName: img)
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 35, height: 35)
                //
                //                        }
                //                        .foregroundColor(.white)
                //                        .padding()
                //                        .background(.green)
                //                        .clipShape(Circle())
                //
                //                    }
                //
                //                }
                //
                //                    LazyVGrid(columns: btnColumns, alignment: .center) {
                //                        ForEach((btnImage), id: \.self ) { img in
                //                            Image(systemName: img)
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 30, height: 30)
                //
                //                                .foregroundColor(.white)
                //                                .padding()
                //                                .background(.green)
                //                                .clipShape(Circle())
                //                        }
                //                        .onTapGesture {
                //                            print("Tap")
                //                        }
                //                    }
                //                    .padding(.vertical, 20)
            }
            .padding(.horizontal)
            
            ScrollView {
                Text("Who's Here?")
                    .font(.title2).bold()
                    .padding()
                
                LazyVGrid(columns: avatarColumns) {
                    ForEach((0...7), id: \.self) { num in
                        FirstNameAvatarView(firstName: "profile \(num)")
                        
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Location Name")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView()
    }
}

struct LocationActionButton: View {
    var color: Color
    var imageName: String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 60, height: 60)
            Image(systemName: imageName)
                .resizable()
                .scaledToFill()
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
        }
    }
}

struct FirstNameAvatarView: View {
    var firstName: String
    var body: some View {
        VStack {
            AvatarView(size: 64)
            Text(firstName)
                .bold()
                .lineLimit(1)
        }
    }
}


struct BannerImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
    }
}

struct BioTextView: View {
    var bioText: String
    var body: some View {
        Text(bioText)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .frame(height: 70)
            .font(.body)
            .padding()
    }
}
