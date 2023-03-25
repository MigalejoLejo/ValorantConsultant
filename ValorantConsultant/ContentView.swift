//
//  ContentView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 14/3/23.
//

import SwiftUI


// This is the main view
struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack{
               
                List{
                    
                    // Agents
                    NavigationLink(destination: AllPlayersView()) {
                        Image(systemName: "person")
                        Text("Agents")
                        Image("img1").frame(width: 200,height: 50, alignment: .trailing)
                    }

                    // Maps
                    NavigationLink(destination: Text("I Love Vlasta")) {
                        Image(systemName: "map")
                        Text("Maps")
                    }.padding(.vertical, 20)

                }.navigationTitle("Sections")
                    
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
