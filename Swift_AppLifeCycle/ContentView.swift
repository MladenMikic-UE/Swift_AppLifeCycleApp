//
//  ContentView.swift
//  Swift_AppLifeCycle
//
//  Created by MladenMikic on 06.10.2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    // Tested on iOS 16.4 Simulator. Works.
    // @StateObject var appLCManager: ApplicationLifeCycleManager = .shared
    
    // Tested on iOS 16.4 Simulator. Works.
    @EnvironmentObject var appLCManager: ApplicationLifeCycleManager
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Current: \(appLCManager.state.title)")
            
            ForEach(ApplicationLifeCycleState.allCases) { applicationLifeCycleState in
                Button {
                    appLCManager.post(newState: applicationLifeCycleState)
                } label: {
                    Text(applicationLifeCycleState.title)
                }

            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

