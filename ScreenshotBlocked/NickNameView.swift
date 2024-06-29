//
//  NickNameView.swift
//  ScreenshotBlocked
//
//  Created by qwerty on 27.06.2024.
//

import SwiftUI

struct NickNameView: View {
    @AppStorage("nickName") var nickName = "Dogu"
    @State var nick = ""
    var body: some View {
        VStack{
            CustomTF(sfIcon: "person.text.rectangle", hint: "Email ID", value: $nick)
            Spacer()
        }.onAppear{
            nick = nickName
        }
        .padding(.top,50)
        .padding(.vertical, 15)
            .padding(.horizontal, 25)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Kullanıcı Adı")
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        nickName = nick
                    }, label: {
                        Text("Kaydet")
                    }).foregroundColor(Color(.blue))
                        .opacity(nick.isEmpty ? 0 : 1)
                }
            }
        
        
      
    }
}

#Preview {
    NickNameView()
}
