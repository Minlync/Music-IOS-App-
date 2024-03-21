//
//  Park.swift
//  Week04Homework
//
//  Created by Victoria Liu on 9/28/23.
//

import SwiftUI
import AVFoundation

let parkColor = Color(red: 46/255, green: 58/255, blue: 16/255)
let backgroundColor2 = Color(red: 201/255, green: 202/255, blue: 182/255)

struct Park: View {
    @State private var soundFile = "park.wav"
    @State private var player: AVAudioPlayer? = nil
    @State private var playing = false
    
    var body: some View {
        ZStack{
            backgroundColor2
            TimelineView(.animation) { context in
                VStack {
                    HStack {
                        Image(systemName: "heart.fill").foregroundColor(parkColor)
                        Text("PARK").font(.title).foregroundStyle(parkColor)
                        Image(systemName: "heart.fill").foregroundColor(parkColor)
                    }
                    Image(uiImage: UIImage(named: "park.jpg")!).resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom)
                        .frame(width: 300)
                    HStack {
                        if playing == true {
                            Text("Currently Playing").foregroundStyle(parkColor)
                            Image(systemName: "headphones").foregroundColor(parkColor)
                        } else {
                            Text("Audio Not Playing").foregroundStyle(parkColor)
                            Image(systemName: "speaker.slash.fill").foregroundColor(parkColor)
                        }
                    }.padding(.bottom)
                    HStack(spacing: 40.0) {
                        Button("PLAY") {
                            print("Button Play")
                            player = loadBundleAudio(soundFile)
                            print("player", player as Any)
                            
                            // Loop indefinitely
                            player?.numberOfLoops = -1
                            player?.play()
                            
                            playing = true
                        }.buttonStyle(.borderedProminent).tint(parkColor) //139,64,113
                        Button("STOP") {
                            print("Button Stop")
                            player?.stop()
                            
                            playing = false
                        }.buttonStyle(.bordered).tint(parkColor)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

struct Park_Previews: PreviewProvider {
    static var previews: some View {
        Park()
    }
}
