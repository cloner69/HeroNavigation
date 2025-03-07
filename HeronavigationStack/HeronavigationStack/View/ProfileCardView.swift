//
//  ProfileCardView.swift
//  HeronavigationStack
//
//  Created by Adrian Suryo Abiyoga on 23/01/25.
//

import SwiftUI

/// Profile Card View
struct ProfileCardView: View {
    var profile: Profile
    @Binding var config: HeroConfiguration
    var onClick: (CGRect) -> ()
    /// View Properties
    @State private var viewRect: CGRect = .zero
    var body: some View {
        Button {
            onClick(viewRect)
        } label: {
            HStack(spacing: 12) {
                Image(profile.profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)
                    .opacity(config.activeID == profile.id ? 0 : 1)
                    .onGeometryChange(for: CGRect.self) {
                        $0.frame(in: .global)
                    } action: { newValue in
                        viewRect = newValue
                    }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(profile.userName)
                        .font(.callout)
                        .foregroundStyle(Color.primary)
                    
                    Text(profile.lastMsg)
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            .contentShape(.rect)
        }
    }
}

#Preview {
    ContentView()
}
