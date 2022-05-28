//
//  DataClasses.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-21.
//

import Foundation

struct CreateInvitationType: Codable {
    let connectionID: String
    let invitation: InvitationSubType
    let invitationURL: String

    enum CodingKeys: String, CodingKey {
        case connectionID = "connection_id"
        case invitation
        case invitationURL = "invitation_url"
    }
}

struct InvitationSubType: Codable {
    let type, id: String
    let recipientKeys: [String]
    let serviceEndpoint: String
    let label: String

    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case id = "@id"
        case recipientKeys, serviceEndpoint, label
    }
    
}

struct Connections: Codable {
    let results: [ConnectionArray]
}


struct ConnectionArray: Codable, Identifiable {
    let id: UUID = UUID()
    let accept, invitationKey, connectionID: String
    let requestID: String?
    let createdAt, updatedAt, theirRole, routingState: String
    let connectionProtocol: String
    let myDid: String?
    let invitationMode, state, rfc23State: String
    let invitationMsgID, theirLabel, theirDid: String?

    enum CodingKeys: String, CodingKey {
        case accept
        case invitationKey = "invitation_key"
        case connectionID = "connection_id"
        case requestID = "request_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case theirRole = "their_role"
        case routingState = "routing_state"
        case connectionProtocol = "connection_protocol"
        case myDid = "my_did"
        case invitationMode = "invitation_mode"
        case state
        case rfc23State = "rfc23_state"
        case invitationMsgID = "invitation_msg_id"
        case theirLabel = "their_label"
        case theirDid = "their_did"
    }
}

struct AcceptRequestType: Codable {
    let connectionProtocol, requestID, createdAt, connectionID: String
    let routingState, invitationMode, accept, updatedAt: String
    let myDid, invitationMsgID, invitationKey, state: String
    let rfc23State, theirLabel, theirRole: String

    enum CodingKeys: String, CodingKey {
        case connectionProtocol = "connection_protocol"
        case requestID = "request_id"
        case createdAt = "created_at"
        case connectionID = "connection_id"
        case routingState = "routing_state"
        case invitationMode = "invitation_mode"
        case accept
        case updatedAt = "updated_at"
        case myDid = "my_did"
        case invitationMsgID = "invitation_msg_id"
        case invitationKey = "invitation_key"
        case state
        case rfc23State = "rfc23_state"
        case theirLabel = "their_label"
        case theirRole = "their_role"
    }
}
