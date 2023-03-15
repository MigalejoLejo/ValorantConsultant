//
//  ContentView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 14/3/23.
//

import SwiftUI


// This is the list that will be shown in the iPhones screen
struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: AgentsList) {
                    Image(systemName: "person")
                    Text("Agents")
                }
                NavigationLink(destination: Text("Agents")) {
                    Image(systemName: "map")
                    Text("Maps")
                }
            }
            .navigationTitle("Sections")
         
            .onAppear{
                viewModel.getAgents()
            }
        }
    }
    
    var AgentsList: some View {
        NavigationView {
            List{
                ForEach (viewModel.agents.data, id:\.self) { object in
                    NavigationLink(destination: getSingleAgent(object: object)) {
                        Text(object.displayName)
                            .bold()
                    }
                }
            }
        }
    }
}


func getSingleAgent(object: Object)-> some View{
    var AgentDetails: some View {
        NavigationView {
            List{
                Text(object.description)
            }            .navigationTitle(object.displayName)

        }
    }
    
    return AgentDetails
}

// Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
var AgentsList: some View {
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
 */
