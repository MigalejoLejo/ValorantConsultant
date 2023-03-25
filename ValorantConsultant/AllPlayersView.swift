
//
//  AgentsView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 16/3/23.
//

import SwiftUI
struct AllPlayersView: View {
    @StateObject var playerViewModel: PlayerViewModel = PlayerViewModel()
    
    
    // List with all Agents
    var body: some View {
        NavigationView {
            List{
                ForEach (playerViewModel.allPlayers, id:\.self) { player in
                    NavigationLink(destination: SinglePlayerView().getPlayerView(player: player)){
                        AsyncImage(url: URL(string: player.killfeedPortrait))

                        Text(player.displayName)
                            .bold()
                    }
                }
                .navigationTitle("Players")
                .navigationBarTitleDisplayMode(.large)
                .navigationSplitViewStyle(.balanced)
                
            }
        }.onAppear{
            playerViewModel.getAllPlayers()
        }
    }
}

//Preview
struct AllPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AllPlayersView()
    }
}


