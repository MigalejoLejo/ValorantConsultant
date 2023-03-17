//
//  SingleAgentView.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 16/3/23.
//

import SwiftUI

struct SingleAgentView: View {
   
   
    var body: some View {
        VStack{
            Text("")
        }
        
    }
    
    
    func get(object: Object)-> some View{
        let agent = object
        
        var AgentDetails: some View {
            List {
                VStack{
                    Spacer()
                    Text("UUID").bold()
                    Text(agent.uuid)
                   
                        .font(.system(size: 13, weight: .light, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                }
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
                /*
                AsyncImage(url: URL(string: agent.bustPortrait)){ image in image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 800, height: 800)
                */
            }
            
        }
        return AgentDetails
    }

}

struct SingleAgentView_Previews: PreviewProvider {
    
    static var previews: some View {
        SingleAgentView()
    }
}
