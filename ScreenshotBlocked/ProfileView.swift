//
//  ProfileView.swift
//  ScreenshotBlocked
//
//  Created by qwerty on 27.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var isImageFullScreen = false
    
    var body: some View {
        NavigationStack {
            VStack{
                
                ScreenshotPreventView {
                    Image("IMG")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(min(150, 150) / 2)
                        .overlay(RoundedRectangle(cornerRadius: min(150, 150) / 2).stroke(Color(.label), lineWidth: 2))
                        .shadow(radius: 5)
                        .onTapGesture {
                            withAnimation {
                                isImageFullScreen = true
                            }
                        }
                    
                }.frame(width: 180,height: 180)
                    .padding(.top,-49)
                
                List {
                    Section("Kullanıcı Adı") {
                        NavigationLink(destination: NickNameView()){
                            Label("Kullanıcı Adı", systemImage: "person.text.rectangle")
                        }
                    }
                }
            }.foregroundColor(Color(.label))
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("Hesap")
                    }
                }
            
                .fullScreenCover(isPresented: $isImageFullScreen) {
                    ScreenshotPreventView{
                        FullScreenImageView(image: Image("IMG"), isPresented: $isImageFullScreen)
                    }
                }
        }
    }
}

struct FullScreenImageView: View {
    let image: Image
    @Binding var isPresented: Bool
    
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .gesture(
                        DragGesture()
                            .updating($dragOffset) { (value, state, _) in
                                state = value.translation
                            }
                            .onEnded { value in
                                if value.translation.height > 100 {
                                    withAnimation {
                                        isPresented = false
                                    }
                                }
                            }
                    )
                
                Spacer()
            }
        }
        .onTapGesture {
            withAnimation {
                isPresented = false
            }
        }
    }
}

#Preview {
    ProfileView()
}

