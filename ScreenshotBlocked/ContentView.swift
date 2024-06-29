//
//  ContentView.swift
//  ScreenshotBlocked
//
//  Created by qwerty on 27.06.2024
//  stackoverflow : https://stackoverflow.com/questions/68421711/how-to-hide-views-from-screenshots-screen-recordings-in-swiftui


import SwiftUI

struct ContentView: View {
    @AppStorage("nickName") var nickName = "Dogu"
    @AppStorage("isDarkMode") private var isDarkMode: String = "Default"
    @State private var isShow1 = false
    @State private var isShow2 = false
    var body: some View {
        VStack {
            HStack{
                VStack {
                    Button("", systemImage: "person") {
                        isShow2.toggle()
                    }
                    Text(nickName)
                        .font(.subheadline)
                }
                Spacer()
                Button("", systemImage: "camera") {
                }
                Button("", systemImage: "gear") {
                    isShow1.toggle()
                }
            }.overlay(
                Text("Sohbetler")
                    .foregroundColor(Color(.label))
            )
            .foregroundColor(Color(.label))
            .font(.system(size: 20))
            
            ForEach(1...10, id: \.self) { _ in
                VStack(alignment: .leading, spacing: 6) {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .frame(height: 25)
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .frame(height: 15)
                        .padding(.trailing, 50)
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.gray.opacity(0.15))
                        .padding(.trailing, 150)
                }
            }
        }.sheet(isPresented: $isShow1, content: {
            Settings()
        })
        
        .sheet(isPresented: $isShow2, content: {
            NickNameView()
        })
        .padding(.horizontal, 25)
        .preferredColorScheme(isDarkMode == "Karanlık" ? .dark : .light)
    }
}


#Preview {
    ContentView()
}
