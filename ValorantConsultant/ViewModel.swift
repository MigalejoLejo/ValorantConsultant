//
//  ModelView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 15/3/23.
//

import SwiftUI

// ViewModel-Class with Function that request information from the API
class ViewModel: ObservableObject{
    @Published var agents: Agent = Agent(status:1,data: [Object(uuid:"",displayName: "",description: "", developerName: "", killfeedPortrait: "")])

    
    // Request information from API und stores the date 
    func getAgents(){
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {return}
            
            //Convert from JSON
            do {
                let agents = try
                JSONDecoder().decode(Agent.self, from: data)
                DispatchQueue.main.async {
                    self?.agents = agents
                }
                print(agents)
            } catch {print(error)}
        }
        task.resume()
    }
}

