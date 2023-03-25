//
//  AgentsList.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 14/3/23.
//

import SwiftUI

struct AgentsList: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear{
                ViewModel().getAgents()
            }
    }
}

struct AgentsList_Previews: PreviewProvider {
    static var previews: some View {
        AgentsList()
    }
}
