//
//  SingleAgentView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 16/3/23.
//

import SwiftUI

struct SingleAgentView: View {
    
    // Dummy to be used as a test object
    let dummyObject:Object = Object(uuid:"e370fa57-4757-3604-3648-499e1f642d3f",displayName: "Dummy Gekko",description: "This is a dummy gekko", developerName: "Dummy Gekko Dev", killfeedPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/killfeedportrait.png")

    
    // This is just a Dummy to see how the result will look
    var body: some View {
        VStack{
            get(object: dummyObject)
        }
        
    }
    
    
    
    //This gets an agent Object and uses it to display its informations
    func get(object: Object)-> some View{
        let agent = object
        print(String(describing: agent))

        
        //This is the view that will be return
        var AgentDetails: some View {
           
          //Agent Information displayed
            List {
                // UUID
                VStack{
                    Spacer()
                    Text("UUID").bold()
                    Text(agent.uuid)
                   
                        .font(.system(size: 13, weight: .light, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                }
                // Agent name + Profil Image
                HStack{
                    VStack{
                       
                        Text("Agent Name:")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("  "+agent.displayName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 30, weight: .bold, design: .default))
                     
                    }
                    AsyncImage(url: URL(string: object.killfeedPortrait))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                //Description
                VStack{
                    Spacer()
                    Text("Description:")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\n"+agent.description)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16, weight: .light, design: .default))
                    Spacer()
                }
                
                // Call the Image with help of the UUID
                AsyncImage(url: URL(string: "https://media.valorant-api.com/agents/"+agent.uuid+"/fullportrait.png")){ image in image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 800, height: 800)
                
            }.navigationBarHidden(true)
        }
        return AgentDetails
    }

}


// Preview
struct SingleAgentView_Previews: PreviewProvider {
    
    static var previews: some View {
        SingleAgentView()
    }
}
