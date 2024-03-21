//
//  Skyview.swift
//  Week5 Audio Player SwiftUi
//
//  Created by Minglin Chen on 10/8/23.
//




import SwiftUI
import AVFoundation

class SkyviewAudioManager:NSObject,ObservableObject,
                   AVAudioPlayerDelegate {
    
    @Published var audioPlayer2: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var currentTime: TimeInterval = 0
    @StateObject private var audioManager = SkyviewAudioManager()
    let audioFileName = "skyview.wav"
    
    override init(){
        super.init()
        setupAudio()
        startTime()
    }
    func setupAudio(){
        guard let audioFileURL =
                Bundle.main.url(forResource:audioFileName, withExtension: nil) else{
            print("Error")
            return
            
        }
        do{
            audioPlayer2 = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer2?.prepareToPlay()
            audioPlayer2?.delegate = self
        }catch{
            print("Error: \(error)")
        }
    }
    func playAudio(){
        audioPlayer2?.play()
    }
    func pauseAudio(){
        audioPlayer2?.pause()
    }
    func formatTime(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval / 60)
        let seconds =
        Int (timeInterval.truncatingRemainder(dividingBy: 60))
        return String(format:"%02d: %02d", minutes, seconds)
    }
    func startTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        { [weak self] timer in
            guard let self = self, self.isPlaying else { return }
            self.currentTime = self.audioPlayer2?.currentTime ?? 0
        }
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer,
        successfully flag: Bool) {
        isPlaying = false
        currentTime = 0
    }
}
//    override init(audioPlayer:AVAudioPlayer? = nil, isPlaying: Bool = false, currentTime:TimeInterval)
//    {
//        self.audioPlayer = audioPlayer
//        self.isPlaying = isPlaying
//        self.currentTime = currentTime
        
    
    


struct Skyview: View {
    
    @StateObject private var audioManager = SkyviewAudioManager()
    @State private var torationAngel : Angle = .degrees(0)
    
    var body: some View {
        VStack {
            VStack{
                Text("Skyview")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                    .offset(y:180)
                
                Text("Study Music")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .offset(y:180)
            }
            .background(
                Image("skytop")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 276, height: 580)
                    .padding(.bottom, 260)
            )
            .background(
                Image("Skyview")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 393, height: 1080)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            )
            
            Text(audioManager.formatTime(audioManager.currentTime))
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.medium)
                )
                .foregroundColor(.white)
                .offset(y: 220)
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 250, height: 57)
                    .background(Color.black)
                    .cornerRadius(28.5)
                    .shadow(color:.black.opacity(0.4), radius: 44, x: 0, y: 4)
                
                Image("Ellipse 3")
                    .frame(width: 77, height: 77)
                    .shadow(color:.black, radius: 50, x: 0, y: 4)
                    .clipShape(Circle())
                
                Button(action: {
                    if audioManager.isPlaying {
                        audioManager.audioPlayer2?.pause()
                    } else {
                        audioManager.playAudio()
                    }
                    audioManager.isPlaying.toggle()
                }) {
                    Image(systemName: audioManager.isPlaying ? "pause.fill" : "play.fill")
                        .font(.system(size: 33))
                        .foregroundColor(.white)
                }
                
                HStack{
                    NavigationLink(destination: harvestseason()) {
                        Image(systemName: "backward.fill")
                            .frame(width: 19, height: 19)
                            .foregroundColor(.white)
                    }
                    .offset(x: -60)
                    
                    NavigationLink(destination: Midnightstars()) {
                        Image(systemName: "forward.fill")
                            .frame(width: 19, height: 19)
                            .foregroundColor(.white)
                    }
                    .offset(x: 60)
                }
            }
            .offset(y: 240)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Skyview()
}

