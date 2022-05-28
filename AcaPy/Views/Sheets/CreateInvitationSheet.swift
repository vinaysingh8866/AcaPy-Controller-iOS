//
//  CreateInvitationSheet.swift
//  AcaPy
//
//  Created by Vinay Singh on 2022-05-24.
//

import SwiftUI

struct CreateInvitationSheet:View {
    @Binding var showNewInvitation:Bool
    @Binding var invitation:CreateInvitationType
    var body: some View{
        
            ZStack{
                
            VStack{
                
                HStack{
                    
                    Spacer()
                    Button {
                        showNewInvitation = false
                    } label: {
                        Text("Close").padding()
                    }

                }.padding()
                
                Text("New Invitation").font(.system(size: 30)).bold()
                Spacer()
                
                VStack{
                    HStack{
                        Text("Label").bold().frame(width: 80)
                        Text(invitation.invitation.label).padding()
                            .font(.custom("Small Heading", size: 14))
                            .frame(height: 10)
                            .frame(width: 280)
                    }
                    
                    HStack{
                        Text("ID").bold()
                            .frame(width: 80)
                        Text(invitation.connectionID).padding()
                            .font(.custom("Small Heading", size: 14))
                            .frame(width: 280)
                            .padding()
                        
                    }
                    
                    HStack{
                        Text("Keys").bold().frame(width: 80)
                        Text(invitation.invitation.recipientKeys.first ?? "").padding()
                            .font(.custom("Small Heading", size: 14))
                            .frame(height: 10)
                            .frame(width: 280)
                    }
                    
                    HStack{
                        Text("Invite Url").bold().frame(width: 80)
                        Text(invitation.invitationURL).padding()
                            .font(.custom("Small Heading", size: 14))
                            .frame(height: 10)
                            .frame(width: 280)
                    }
                }
                .frame(width:380,height: 400, alignment: .center)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(5)
                .padding(.horizontal)
                HStack{
                    Button {
                        do{
                            let jsonEncoder = JSONEncoder()
                            let jsonData = try jsonEncoder.encode(invitation.invitation)
                            let json = String(data: jsonData, encoding: String.Encoding.utf8)
                            UIPasteboard.general.setValue(json!, forPasteboardType: "public.plain-text")
                            print(json!)
                        }
                        catch{
                            UIPasteboard.general.setValue("Error", forPasteboardType: "public.plain-text")
                        }
                    } label: {
                        ZStack{
                            Color.black
                            Text("Copy Invitation").foregroundColor(.white)
                        }.frame(width: 100, height: 60, alignment: .center)
                        .cornerRadius(4)
                        
                    }
                    
                    Button {
                        UIPasteboard.general.setValue(invitation.invitationURL, forPasteboardType: "public.plain-text")
                    } label: {
                        ZStack{
                            Color.black
                            Text("Copy URL").foregroundColor(.white)
                        }.frame(width: 100, height: 60, alignment: .center)
                        .cornerRadius(4)
                        
                    }
                }
                Spacer()
            }
            
    }
            
    }
    
}

