//
//  SettingsView.swift
//  ScreenshotBlocked
//
//  Created by qwerty on 27.06.2024.
//


import SwiftUI

struct Settings: View {
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {//ProfileView
                List {
                    Section{
                        
                        NavigationLink(destination: ProfileView()){
                            Label("Hesap", systemImage: "person")
                        }
                        
                        
                        
                        Label("Bağlı Cihazlar", systemImage: "laptopcomputer.and.iphone")

                        NavigationLink(destination: HiddenInfoView(navigationTitle: "Görünüm")){
                            Label("Api", systemImage: "point.3.connected.trianglepath.dotted")
                        }

                    }
                    
                    Section {
                        Label("Görünüm", systemImage: "sun.min")
                    }
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
                }.foregroundColor(Color(.label))
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Ayarlar")
                }
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Bitti")
                    }).foregroundColor(Color(.label))
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    Settings()
}
