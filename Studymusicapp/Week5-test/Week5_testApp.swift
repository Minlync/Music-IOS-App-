//
//  Week5_testApp.swift
//  Week5-test
//
//  Created by Minglin Chen on 10/12/23.
//

import SwiftUI

//@main
//struct Week5_testApp: App {
//    var body: some Scene {
//        WindowGroup {
//            Midnightstars()
//        }
//    }
//}

@main
struct MyApp: App {
    var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            Midnightstars()
               // .environmentObject(audioManager) // Pass AudioManager as an environment object
        }
    }
}
