//
//  AgentsView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 16/3/23.
//

import SwiftUI
struct SinglePlayerView: View {
    @StateObject var playerViewModel: PlayerViewModel = PlayerViewModel()
    
    // List with all Agents
    var body: some View {
        NavigationView {
           getPlayerView(player: Player())
        }
    }
    
    func getPlayerView (player:Player) -> some View {
        let list = List{
            getUuidView(player: player)
            getDisplayNameView(player: player)
            getPlayerDescriptionView(player: player)
            getPlayerPortrait(player: player)
        }.onAppear{
            playerViewModel.getSinglePlayer(url: player.uuid)
        }
        .navigationTitle("Player")
        .navigationBarTitleDisplayMode(.large)
        .navigationSplitViewStyle(.balanced)
        
        return list
    }
    
    func getUuidView(player: Player) -> some View {
        VStack{
            Spacer()
            Text("UUID").bold()
            Text(player.uuid)
           
                .font(.system(size: 13, weight: .light, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
    }
    
    func getDisplayNameView (player: Player) -> some View {
        HStack{
            VStack{
                Text("Agent Name:")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("  "+player.displayName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 30, weight: .bold, design: .default))
             
            }
            AsyncImage(url: URL(string: player.killfeedPortrait))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    func getPlayerDescriptionView(player:Player) -> some View{
        VStack{
            Spacer()
            Text("Description:")
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\n"+player.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16, weight: .light, design: .default))
            Spacer()
        }
    }
    
    //Description
    
    func getPlayerPortrait(player: Player) -> some View {
        let url = "https://media.valorant-api.com/agents/\(player.uuid)/fullportrait.png"
        // Call the Image with help of the UUID
        let image = AsyncImage(url: URL(string: url)){ image in image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 800, height: 800)
        
        return image
    }
    
    
    
}



//Preview
struct SinglePlayerView_Previews: PreviewProvider {
    
   
    
    static var previews: some View {
        SinglePlayerView()
    }
}


