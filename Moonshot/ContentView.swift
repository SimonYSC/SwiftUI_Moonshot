//
//  ContentView.swift
//  Moonshot
//
//  Created by YunShou Chao on 8/2/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingDate = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if showingDate {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(mission.crewNames.joined(separator: ", "))
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(leading:
                HStack {
                    Toggle("Crew Name", isOn: $showingDate)
                    Text("Launch Date")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
