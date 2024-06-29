//
//  HiddenInfoView.swift
//  ScreenshotBlocked
//
//  Created by qwerty on 27.06.2024.
//

import SwiftUI

struct HiddenInfoView: View {

    let navigationTitle: String
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    Section("API Key") {
                        ScreenshotPreventView {
                            Text("ITU98DHGMmgk812KUGNW")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    Section("APNS Key") {
                        ScreenshotPreventView {
                            Text("enitsuji")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }.toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Api")
                }
            }
        }.padding(.top,-10)
        
        
    }
}

#Preview {
    ContentView()
}
