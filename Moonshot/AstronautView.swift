//
//  AstronautView.swift
//  Moonshot
//
//  Created by YunShou Chao on 8/6/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missions = ""
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Missions: \(missions)")

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        var matches = [String]()
        
        // filter missions with
        for mission in missions {
            for crew in mission.crew {
                if crew.name == astronaut.id {
                    matches.append(String(mission.id))
                    break
                }
            }
        }
        
        self.missions = matches.joined(separator: ", ")
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
