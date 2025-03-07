//
//  DetailView.swift
//  HeronavigationStack
//
//  Created by Adrian Suryo Abiyoga on 23/01/25.
//

import SwiftUI

/// Detail View
struct DetailView: View {
    @Binding var selectedProfile: Profile?
    var profile: Profile
    @Binding var config: HeroConfiguration
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                ForEach(messages) { message in
                    MessageCardView(message: message)
                }
            }
            .padding(15)
        }
        .safeAreaInset(edge: .top) {
            if #unavailable(iOS 18) {
                CustomHeaderView()
                    .padding(.vertical, 15)
                    .background {
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .ignoresSafeArea()
                    }
            } else {
                CustomHeaderView()
                    .padding(.top, -25)
                    .padding(.bottom, 15)
                    .background {
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .ignoresSafeArea()
                    }
            }
        }
        .hideNavbarBackground()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                config.isExpandedCompletely = true
            }
        }
    }
    
    /// Custom Header View
    @ViewBuilder
    func CustomHeaderView() -> some View {
        VStack(spacing: 6) {
            ZStack {
                if selectedProfile != nil {
                    Image(profile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(.circle)
                        .opacity(config.isExpandedCompletely ? 1 : 0)
                        .onGeometryChange(for: CGRect.self) {
                            $0.frame(in: .global)
                        } action: { newValue in
                            config.coordinates.1 = newValue
                        }
                        .transition(.identity)
                }
            }
            .frame(width: 50, height: 50)
            
            Button {
                
            } label: {
                HStack(spacing: 2) {
                    Text(profile.userName)
                    
                    Image(systemName: "chevron.right")
                        .font(.caption2)
                }
                .font(.caption)
                .foregroundStyle(Color.primary)
                .contentShape(.rect)
            }
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .topLeading) {
            if #unavailable(iOS 18) {
                Button {
                    selectedProfile = nil
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.trailing, 20)
                        .contentShape(.rect)
                }
                .padding(.leading, 15)
            }
        }
    }
}

#Preview {
    ContentView()
}
