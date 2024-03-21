//
//  Ocean.swift
//  Week04Homework
//
//  Created by Victoria Liu on 9/28/23.
//

import SwiftUI
import AVFoundation

func loadBundleAudio(_ fileName:String) -> AVAudioPlayer? {
    let path = Bundle.main.path(forResource: fileName, ofType:nil)!
    let url = URL(fileURLWithPath: path)
    do {
        return try AVAudioPlayer(contentsOf: url)
    } catch {
        print("loadBundleAudio error", error)
    }
    return nil
}

let oceanColor = Color(red: 139/255, green: 64/255, blue: 113/255)
let backgroundColor = Color(red: 255/255, green: 217/255, blue: 249/255)

struct Ocean: View {
    @State private var soundFile = "ocean.wav"
    @State private var player: AVAudioPlayer? = nil
    @State private var playing = false
    
    var body: some View {
        ZStack{
            backgroundColor
            TimelineView(.animation) { context in
                VStack {
                    HStack {
                        Image(systemName: "heart.fill").foregroundColor(oceanColor)
                        Text("OCEAN").font(.title).foregroundStyle(oceanColor)
                        Image(systemName: "heart.fill").foregroundColor(oceanColor)
                    }
                    Image(uiImage: UIImage(named: "ocean.jpg")!).resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom)
                        .frame(width: 300)
                    HStack {
                        if playing == true {
                            Text("Currently Playing").foregroundStyle(oceanColor)
                            Image(systemName: "headphones").foregroundColor(oceanColor)
                        } else {
                            Text("Audio Not Playing").foregroundStyle(oceanColor)
                            Image(systemName: "speaker.slash.fill").foregroundColor(oceanColor)
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
                        }.buttonStyle(.borderedProminent).tint(oceanColor) //139,64,113
                        Button("STOP") {
                            print("Button Stop")
                            player?.stop()
                            
                            playing = false
                        }.buttonStyle(.bordered).tint(oceanColor)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

struct Ocean_Previews: PreviewProvider {
    static var previews: some View {
        Ocean()
    }
}
