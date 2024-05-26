//
//  ContentView.swift
//  XsAndOs
//
//  Created by Farid Bastoros on 2024-05-25.
//

import SwiftUI

struct StartView: View {
    
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType){
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two Sharing device").tag(GameType.single)
                Text("Challenge youe device").tag(GameType.bot)
                Text("Challenge a friend").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            .accentColor(.primary)
            Text(gameType.description)
                .padding()
            VStack {
                switch gameType {
                case .single:
                    VStack {
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent Name", text: $opponentName)
                    }
                case .bot:
                    TextField("Your Name", text: $yourName)
                case .peer:
                    EmptyView()
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            
            if gameType != .peer {
                Button("Start Game"){
                    focus = false
                    
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undetermined || gameType == .bot && yourName.isEmpty ||
                    gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Xs and Os")
        .inNavigationStack()
    }
}

#Preview {
    StartView()
}
