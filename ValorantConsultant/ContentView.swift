//
//  ContentView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 14/3/23.
//

import SwiftUI


// Data Models to store requested information.
struct Object: Codable, Hashable{
    let uuid:String
    let displayName:String
    let description:String
}
struct Agent: Codable, Hashable{
    let status: Int
    let data:[Object]
}



// ViewModel-Class with Function that request information from the API
class ViewModel: ObservableObject{
    @Published var agents: Agent = Agent(status:1, data: [Object(uuid:"",displayName: "",description: "")])

    
    func getAgents(){
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {return}
            
            //Convert to JSON
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



// This is the list that will be shown in the iPhones screen
struct ContentView: View {
@StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach (viewModel.agents.data, id:\.self) { object in
                    VStack{
                        Text(object.displayName)
                            .bold()
                        Text(object.uuid)
                            .monospacedDigit()
                            .underline()
                            .font(.custom("ID", size: 15))

                        Text(object.description)
                    }
                }
               
            }
            .navigationTitle("Agents")
            .onAppear{
                viewModel.getAgents()
            }
        }
    }
}


// Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
