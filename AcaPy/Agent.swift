//
//  Agent.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-24.
//

import Foundation

class Agent{
    
    var ConnectionUrl:String
    
    init(url:String){
        ConnectionUrl = url
    }
    
    func getConnections() async ->Connections{
        let url = URL(string: ConnectionUrl+"/connections")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        request.httpBody = Data()
        let r = request
        let response:Connections = Connections(results: [])
        do{
            async let (data, _) = try URLSession.shared.data(for: r)
            try! await print(data)
            let decodedResponse:Connections? = try? await JSONDecoder().decode(Connections.self, from: data)
            return decodedResponse ?? response
        }catch{
            
        }
    }
    
    func createNewInvitation() async -> CreateInvitationType{
        let url = URL(string: ConnectionUrl+"/connections/create-invitation")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = Data()
        let r = request
    
        let response:CreateInvitationType = CreateInvitationType(connectionID: "", invitation: InvitationSubType(type: "", id: "", recipientKeys: [], serviceEndpoint: "", label: ""), invitationURL: "")
        do{
            async let (data, _) = try URLSession.shared.data(for: r)
            try! await print(data)
            let decodedResponse:CreateInvitationType? = try? await JSONDecoder().decode(CreateInvitationType.self, from: data)
            return decodedResponse ?? response
        }catch{
            
        }
        
    }
    
    func recieveInvitaion(_data:String) async->AcceptRequestType {
        let url = URL(string: ConnectionUrl+"/connections/receive-invitation?auto_accept=true")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = _data.data(using: .utf8)
        let r = request
        let response = AcceptRequestType(connectionProtocol: "", requestID: "", createdAt: "", connectionID: "", routingState: "", invitationMode: "", accept: "", updatedAt: "", myDid: "", invitationMsgID: "", invitationKey: "", state: "", rfc23State: "", theirLabel: "", theirRole: "")
        do{
            async let (data, _) = try URLSession.shared.data(for: r)
            try! await print(data)
            let decodedResponse:AcceptRequestType? = try? await JSONDecoder().decode(AcceptRequestType.self, from: data)
            return decodedResponse ?? response
        }catch{
            
        }
    }
    
    
}
