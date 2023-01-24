//
//  OnboardView.swift
//  DDG
//
//  Created by Jack Cardinal on 11/3/22.
//

import SwiftUI

struct OnboardView: View {
    
    @Binding var isShowingOnBoardView: Bool

    var body: some View {

            VStack(spacing: 30) {
                HStack {
                    Spacer()
                    
                    Button {
                        isShowingOnBoardView = false
                    } label: {
                        XDismissButton()
                    }
                    .padding([.top, .trailing], 15)
                }
                Spacer()

                
                LogoView(width: 250).shadow(radius: 1.0)

                
                
                VStack (alignment: .leading, spacing: 20) {
                    Button {
                        
                    } label: {
                        OnboardInfoView(imageName: "building.2.crop.circle",
                                        title: "Restaurant Locations",
                                        info: "Find places around the convention center")
                    }
                    Button {
                        
                    } label: {
                        OnboardInfoView(imageName: "checkmark.circle",
                                        title: "Check In",
                                        info: "Lets others know where you are")
                    }
                    Button {
                        
                    } label: {
                        OnboardInfoView(imageName: "person.2.circle",
                                        title: "Find Friends",
                                        info: "See where friends are and join in the fun")
                    }
                }
                .padding(.horizontal, 40)
                Spacer()
            }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView(isShowingOnBoardView: .constant(false))
    }
}

struct OnboardInfoView: View {
    
    var imageName: String
    var title: String
    var info: String
    
    var body: some View {
        HStack (spacing: 20){
            Image(systemName: imageName)
                .resizable()
                .scaledToFill()
                .foregroundColor(.brandPrimary)
                .frame(width: 60, height: 60)
            VStack(alignment: .leading) {
                Text(title).bold()
                    .foregroundColor(.secondary)
                Text(info)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
        }
    }
}


