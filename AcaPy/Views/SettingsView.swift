//
//  SettingsView.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var url:String
    var body: some View {
        VStack{
            TextEditor(text: $url)
                .border(.blue, width: 2).frame(height:50)
                .padding()
            Button {
                
            } label: {
                Text("Connect")
                    .frame(width: 100, height: 60, alignment: .center)
                    .buttonStyle(.borderless)
                    .background(.ultraThinMaterial)
            }

        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
