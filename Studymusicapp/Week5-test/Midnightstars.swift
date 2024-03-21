//
//  ContentView.swift
//  Week5 Audio Player SwiftUi
//
//  Created by Minglin Chen on 10/7/23.
//

import SwiftUI
import AVFoundation

class AudioManager:NSObject,ObservableObject,
                   AVAudioPlayerDelegate {
    
    @Published var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var currentTime: TimeInterval = 0
    
    let audioFileName = "Sunday.wav"
    
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
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.delegate = self
        }catch{
            print("Error: \(error)")
        }
    }
    func playAudio(){
        audioPlayer?.play()
    }
    func pauseAudio(){
        audioPlayer?.pause()
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
            self.currentTime = self.audioPlayer?.currentTime ?? 0
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
        
    
    


struct Midnightstars: View {
//    @EnvironmentObject var audioManager: AudioManager
@StateObject private var audioManager = AudioManager()
    @State private var torationAngel : Angle = .degrees(0)
    var body: some View {
        NavigationView{
            VStack {
                VStack{
                    Text("Midnight Stars")
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
                    
                    Image("TOP")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 276,height: 580)
                    //                    .clipped()
                        .padding(.bottom,260)
                    
                )
                .background(
                    
                    Image("bg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 393,height: 1080)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //                    .clipped()
                        .padding()
                )
                //            .shadow(color:.black,radius: 20,x:0,y:2)
                Text(audioManager.formatTime(audioManager .currentTime))
                    .font(
                        Font.custom("Inter", size: 20)
                            .weight(.medium)
                    )
                    .foregroundColor(.gray)
                    .offset(y:220)
                
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 250,height: 57)
                        .background(Color.black)
                        .cornerRadius(28.5)
                        .shadow(color:.black.opacity(0.4),radius:44, x:0, y: 4)
                    VStack{
                        
                    }
                    Image("Ellipse 3")
                        .frame(width: 77, height: 77)
                    //                    .background(Color.yellow)
                        .shadow(color:.black,radius: 50,x:0,y:4)
                        .clipShape(Circle())
                    
                    Button(action: {
                        if audioManager.isPlaying{
                            audioManager.audioPlayer?.pause()
                            
                        }else{
                            audioManager.playAudio()
                        }
                        audioManager.isPlaying.toggle()
                    }){
                        Image(systemName: audioManager.isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size:33))
                            .foregroundColor(.white)
                        
                        
                    }
                    HStack{
                        NavigationLink (destination:Skyview()){
                        
//                        Button(action: {
//                            
//                        }) {
                            Image(systemName:"backward.fill")
                                .frame(width: 19,height: 19)
                                .foregroundColor(.white)
                        }
                        .offset(x:-60)
                        //                    Button(action: {
                        //
                        //                    }) {
                        NavigationLink (destination:harvestseason()){
                           
                            Image(systemName:"forward.fill")
                                .frame(width: 19,height: 19)
                                .foregroundColor(.white)
                        }
                        
                       
                        .offset(x:60) /*location of icon*/
                    }
                    
                    
                    
                    
                }
                .offset(y:240)
                
            }
        }
        .navigationBarBackButtonHidden(true) /*to hide go back button*/
        
        .onDisappear {
            audioManager.pauseAudio()
        }
        }
    }

    struct Midnightstars_Previews: PreviewProvider {
        static var previews: some View {
            Midnightstars()
        }
    }
