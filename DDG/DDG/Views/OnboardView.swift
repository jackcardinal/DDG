//
//  OnboardView.swift
//  DDG
//
//  Created by Jack Cardinal on 11/3/22.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray,.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("X")
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .background {
                                Circle()
                                    .foregroundColor(.brandPrimary)
                            }
                    }
                    .padding([.top, .trailing], 15)
                }
                Spacer()
                Image("ddg-map-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 250, idealWidth: 250, maxWidth: 250)
                
                VStack (alignment: .leading, spacing: 20) {
                    Button {
                        
                    } label: {
                        HStack (spacing: 20){
                            Image(systemName: "building.2.crop.circle")
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(.brandPrimary)
                                .frame(width: 60, height: 22)
                            VStack(alignment: .leading) {
                                Text("Restaurant Locations")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                Text("Find places around the \nconvention center")
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                    }
                    Button {
                        
                    } label: {
                        HStack (spacing: 20){
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(.brandPrimary)
                                .frame(width: 60, height: 22)
                            VStack(alignment: .leading) {
                                Text("Restaurant Locations")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                Text("Find places around the \nconvention center")
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                    }
                    Button {
                        
                    } label: {
                        HStack (spacing: 20){
                            Image(systemName: "person.2.circle")
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(.brandPrimary)
                                .frame(width: 60, height: 22)
                            VStack(alignment: .leading) {
                                Text("Restaurant Locations")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                Text("Find places around the \nconvention center")
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
