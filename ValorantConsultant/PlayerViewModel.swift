//
//  ApiFetcher.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 20/3/23.
//

import SwiftUI
// ViewModel-Class with Function that request information from the API
class PlayerViewModel: ObservableObject{
    @Published var allPlayers: [Player] = [Player()]
    @Published var player: Player = Player()

    
    // Request information from API und stores the date
    func getAllPlayers(){
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {return}
            
            //Convert from JSON
            do {
                let allPlayersModel = try
                JSONDecoder().decode(AllPlayersModel.self, from: data)
                DispatchQueue.main.async {
                    self?.allPlayers = allPlayersModel.data
                }
            } catch {print(error)}
        }
        task.resume()
    }
     
    
    
    func getSinglePlayer(url: String){
        guard let url = URL(string: "https://valorant-api.com/v1/agents/"+url) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {return}
            
            //Convert from JSON
            do {
                let singlePlayerModel = try
                JSONDecoder().decode(SinglePlayerModel.self, from: data)
                DispatchQueue.main.async {
                    self?.player = singlePlayerModel.data
                }
            } catch {print(error)}
        }
        task.resume()
    }
    
    
    
    
    
}
