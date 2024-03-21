//
//  Rainforest.swift
//  Week04Homework
//
//  Created by Victoria Liu on 9/28/23.
//

import SwiftUI
import AVFoundation

let rainforestColor = Color(red: 71/255, green: 91/255, blue: 87/255)
let backgroundColor3 = Color(red: 189/255, green: 202/255, blue: 201/255)

struct Rainforest: View {
    @State private var soundFile = "rainforest.mp3"
    @State private var player: AVAudioPlayer? = nil
    @State private var playing = false
    
    var body: some View {
        ZStack{
            backgroundColor3
            TimelineView(.animation) { context in
                VStack {
                    HStack {
                        Image(systemName: "heart.fill").foregroundColor(rainforestColor)
                        Text("RAINFOREST").font(.title).foregroundStyle(rainforestColor)
                        Image(systemName: "heart.fill").foregroundColor(rainforestColor)
                    }
                    Image(uiImage: UIImage(named: "rainforest.jpg")!).resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom)
                        .frame(width: 300)
                    HStack {
                        if playing == true {
                            Text("Currently Playing").foregroundStyle(rainforestColor)
                            Image(systemName: "headphones").foregroundColor(rainforestColor)
                        } else {
                            Text("Audio Not Playing").foregroundStyle(rainforestColor)
                            Image(systemName: "speaker.slash.fill").foregroundColor(rainforestColor)
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
                        }.buttonStyle(.borderedProminent).tint(rainforestColor) //139,64,113
                        Button("STOP") {
                            print("Button Stop")
                            player?.stop()
                            
                            playing = false
                        }.buttonStyle(.bordered).tint(rainforestColor)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

struct Rainforest_Previews: PreviewProvider {
    static var previews: some View {
        Rainforest()
    }
}
