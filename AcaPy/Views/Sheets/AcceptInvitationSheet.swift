//
//  AcceptInvitationSheet.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-24.
//

import SwiftUI

struct AcceptInvitationSheet: View {
    
    @State var url = ""
    @State var agent:Agent
    @State var invitation:AcceptRequestType = AcceptRequestType(connectionProtocol: "", requestID: "", createdAt: "", connectionID: "", routingState: "", invitationMode: "", accept: "", updatedAt: "", myDid: "", invitationMsgID: "", invitationKey: "", state: "", rfc23State: "", theirLabel: "", theirRole: "")
    @State var done = false
    
    var body: some View {
        VStack{
            
            TextField("Enter Invitaion ",text: $url).frame(width: 300, height: 50, alignment: .center).border(.black, width: 2)
                
            Button {
                let dat:String = String(url.split(separator: "?")[1])
                let data = String(dat.dropFirst(4))
                let decodedData = Data(base64Encoded: data)!
                let decodedString = String(data: decodedData, encoding: .utf8)!
                Task.init(priority: .high, operation: {
                    invitation = (await agent.recieveInvitaion(_data: decodedString))
                    done = true
                })
                
            } label: {
                ZStack{
                    Text("Recieve Invitation")
                }
            }
            if(done){
                HStack{
                    Text("Name").padding()
                    Text(invitation.theirLabel)
                    Text("State").padding()
                    Text(invitation.rfc23State)
                    
                }
                
            }
        }
    }
}

struct AcceptInvitationSheet_Previews: PreviewProvider {
    static var previews: some View {
        AcceptInvitationSheet(agent: Agent(url: ""))
    }
}
