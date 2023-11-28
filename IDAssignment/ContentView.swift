//
//  ContentView.swift
//  IDAssignment
//
//  Created by Sanjay Mali on 28/11/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @ObservedObject private var requestViewModel = RequestViewModel()
    var body: some View {
        VStack{
            Text("IDNOW CHATBOT")
                .foregroundColor(.orange)
                .bold()
                .padding()
        }
        HStack {
            Button("Send Request") {
                requestViewModel.sendRequest()
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            Button("Send Multiple Requests") {
                requestViewModel.sendMultipleRequests()
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.black)
        }
        VStack{
            Button("Chat with Bot") {
                requestViewModel.sendChatBotRequest()
            }
            .padding()
            .buttonStyle(.bordered)
            
            if let acknowledgmentMessage = requestViewModel.acknowledgmentMessage {
                Text(acknowledgmentMessage)
                    .foregroundColor(acknowledgmentMessage.contains("Not") ? .red : .green)
                    .fontWeight(.heavy)
                    .padding()
                
            }
            if let chatBotResponse = requestViewModel.chatBotResponse {
                Text("Heyy! I'm bot: \(chatBotResponse)")
                    .foregroundColor(.primary)
                    .italic()
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
