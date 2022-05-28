//
//  MainView.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-22.
//

import SwiftUI

struct MainView: View {
    @State var connected = false
    @AppStorage("url") var url: String = "http://147.182.224.14:8089"
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UITabBar.appearance().unselectedItemTintColor = .gray
      }
    
    var body: some View {
            ZStack{
                if(connected){
                    TabView {
                        ConnectionView(url: $url)
                                .tabItem {
                                    Label("Connections", systemImage: "person.3.fill")
                                }

                            SettingsView(url: $url)                                .tabItem {
                                    Label("Settings", systemImage: "gearshape.fill")
                        }
                    }.onAppear {
                       
                    }
                }
                else{
                    VStack{
                        TextEditor(text: $url)
                            .border(.blue, width: 2).frame(height:50)
                            .padding()
                        Button {
                            connected = true
                        } label: {
                            Text("Connect")
                                .frame(width: 100, height: 60, alignment: .center)
                                .buttonStyle(.borderless)
                                .background(.ultraThinMaterial)
                        }

                    }
                }
            }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
