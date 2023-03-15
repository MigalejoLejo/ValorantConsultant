//
//  ContentView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 14/3/23.
//

import SwiftUI


struct Object: Codable, Hashable{
    let uuid:String
    let displayName:String
    let description:String
}
struct Agent: Codable, Hashable{
    let status: Int
    let data:[Object]
    
    // Need to figure this out
}




class ViewModel: ObservableObject{
    @Published var agents: Agent = Agent(status:1, data: [Object(uuid:"",displayName: "",description: "")])

    func getAgents(){
        
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
       
        
       
        
            //Convert to JSON
            do {
                let agents = try
                JSONDecoder().decode(Agent.self, from: data)
                DispatchQueue.main.async {
                    self?.agents = agents
                }
            }
            catch {
                print(error)
            }
         
        }
         
    
        print(task)
        task.resume()
        
        
    }
}




struct ContentView: View {
@StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List{
                HStack{
                    Text("Hey: "+String(viewModel.agents.status))
                        .bold()
                    Text("Agent: "+String(viewModel.agents.data[0].displayName))
                }
                
            }
            .navigationTitle("Agents")
            .onAppear{
                viewModel.getAgents()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
