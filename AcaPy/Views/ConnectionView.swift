//
//  CreateInvitation.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-21.
//

import SwiftUI

struct ConnectionView: View {
    
    @State var agent = Agent(url:"http://147.182.224.14:8088")
    @Binding var url:String
    @State var invitation:CreateInvitationType = CreateInvitationType(connectionID: "", invitation: InvitationSubType(type: "", id: "", recipientKeys: [], serviceEndpoint: "", label: ""), invitationURL: "")
    
    @State var showNewInvitation = false
    @State var showAcceptInvitation = false
    @State var connection:Connections = Connections(results: [])
    func getData() async {
        invitation = await agent.createNewInvitation()
    }
    
    var body: some View {
            ZStack{
                Color.white.opacity(0.3).ignoresSafeArea(.all, edges: .top)
                    .onAppear {
                        agent = Agent(url: url)
                    }
                VStack{
                    HStack{
                        Text("Connections").font(.system(size: 30)).bold().padding(.top, -15).padding()
                        Spacer()
                        Button {
                            Task.init(priority: .high) {
                                await getData()
                            }
                            showNewInvitation=true
                        } label: {
                            ZStack{
                                Color.black
                                Image(systemName: "person.fill.badge.plus").foregroundColor(.white)
                            }.frame(width: 35, height: 35, alignment: .center)
                            .cornerRadius(35)
                            .padding(.top, -15).padding()
                            
                                
                        }
                        
                        Button {
                            showAcceptInvitation = true
                        } label: {
                            ZStack{
                                Color.black
                                Image(systemName: "link.badge.plus").foregroundColor(.white)
                            }.frame(width: 35, height: 35, alignment: .center)
                            .cornerRadius(35)
                            .padding(.top, -15).padding()
                        }
                    }
                    
                    ScrollView{
                        ForEach(connection.results){con in
                           
                                ZStack{
                                    (con.state=="active") ? Color.green.opacity(0.5) : Color.yellow.opacity(0.5)
                                    HStack{
                                        Text("Name").bold().padding()
                                        Text(con.theirLabel ?? "")
                                        Text("Status").bold().padding()
                                        Text(con.state)
                                    }
                                }
                                .frame(height: 40, alignment: .center)
                                .cornerRadius(6)
                                .padding(4)
                            
                            
                        }
                    }.padding(.bottom, 10)
                    
                    
            }
                
            }.onAppear(perform: {
                Task.init (priority: .high, operation: {
                    connection = await agent.getConnections()
                })
            }).sheet(isPresented: $showAcceptInvitation) {} content: {
                AcceptInvitationSheet(agent: agent)
            }
            .sheet(isPresented: $showNewInvitation) {} content: {
                CreateInvitationSheet(showNewInvitation: $showNewInvitation, invitation: $invitation)
            }
            
    }
}




struct MainViehw_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView(url: .constant("http://147.182.224.14:8089"))
    }
}
