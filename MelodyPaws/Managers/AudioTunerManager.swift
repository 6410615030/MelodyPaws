//
//  AudioTunerManager.swift
//  MelodyPaws
//
//  Created by Babypowder on 2/5/2567 BE.
//

import Foundation
import AVFoundation

//class AudioTunerManager {
//    
//    init() {
//        do {
//            let file = try AKAudioFile(readFileName: "someones-voice.wav")
//                
//            let player = try AKAudioPlayer(file: file)
//            player.looping = true
//                
//            let timePitch = AKTimePitch(player)
//            timePitch.pitch = 0.5
//            AKManager.output = timePitch
//                
//            let pitchShifter = AKPitchShifter(player)
//            pitchShifter.shift = 1.5
//            AKManager.output = pitchShifter
//                
//            try AKManager.start()
//                
//            player.play()
//                
//        } catch {
//          print(error.localizedDescription)
//        }
//    }
//}

class AudioTunerManager: NSObject, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder?
    var audioEngine: AVAudioEngine?
    var audioFile: AVAudioFile?
    
    override init() {
        super.init()
        setupAudioSession()
    }
    
    func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
    
    func requestMicrophoneAccess() {
        AVAudioApplication.requestRecordPermission { granted in
            DispatchQueue.main.async {
                if granted {
                    print("Microphone access granted")
                } else {
                    print("Microphone access denied")
                }
            }
        }
    }
    
    func startRecording() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentsPath.appendingPathComponent("recording.wav")
        
        let settings: [String: Any] = [
            AVFormatIDKey: kAudioFormatLinearPCM,
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
            print("Error starting audio recording: \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        audioRecorder = nil
        guard let audioRecorderURL = audioRecorder?.url else {
            print("Audio recorder URL is nil.")
            return
        }
        do {
            audioFile = try AVAudioFile(forReading: audioRecorderURL)
        } catch {
            print("Error creating audio file: \(error.localizedDescription)")
        }
    }

    func tunePitch() {
            guard let audioFile = self.audioFile else {
                print("Audio file is nil.")
                return
            }
            
            audioEngine = AVAudioEngine()
            
            let audioPlayerNode = AVAudioPlayerNode()
            audioEngine?.attach(audioPlayerNode)
            
            let pitchShift = AVAudioUnitTimePitch()
            pitchShift.pitch = 1000 // Adjust pitch value as needed
            
            audioEngine?.attach(pitchShift)
            
            audioEngine?.connect(audioPlayerNode, to: pitchShift, format: nil)
            audioEngine?.connect(pitchShift, to: (audioEngine?.outputNode)!, format: nil)
            
            do {
                try audioEngine?.start()
                audioPlayerNode.scheduleFile(audioFile, at: nil)
                audioPlayerNode.play()
            } catch {
                print("Error starting audio engine: \(error.localizedDescription)")
            }
        }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            stopRecording()
            tunePitch()
        } else {
            print("Recording failed.")
        }
    }
    
//    func playTunedSound() {
//        guard let audioFile = self.audioFile else {
//            print("Audio file is nil.")
//            return
//        }
//        
//        let audioEngine = AVAudioEngine()
//        let audioPlayerNode = AVAudioPlayerNode()
//        
//        audioEngine.attach(audioPlayerNode)
//        
//        let pitchShift = AVAudioUnitTimePitch()
//        pitchShift.pitch = 1000 // Adjust pitch value as needed
//        
//        audioEngine.attach(pitchShift)
//        
//        audioEngine.connect(audioPlayerNode, to: pitchShift, format: nil)
//        audioEngine.connect(pitchShift, to: audioEngine.outputNode, format: nil)
//        
//        do {
//            try audioEngine.start()
//            audioPlayerNode.scheduleFile(audioFile, at: nil)
//            audioPlayerNode.play()
//        } catch {
//            print("Error starting audio engine: \(error.localizedDescription)")
//        }
//    }
    func playTunedSound() {
        guard let audioFile = self.audioFile else {
            print("Audio file is nil.")
            return
        }

        audioEngine = AVAudioEngine()

        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine?.attach(audioPlayerNode)

        let pitchShift = AVAudioUnitTimePitch()
        pitchShift.pitch = 1000 // Adjust pitch value as needed

        audioEngine?.attach(pitchShift)

        audioEngine?.connect(audioPlayerNode, to: pitchShift, format: nil)
        audioEngine?.connect(pitchShift, to: (audioEngine?.outputNode)!, format: nil)

        do {
            try audioEngine?.start()
            print("Audio engine started.")
            audioPlayerNode.scheduleFile(audioFile, at: nil) { [weak self] in
                print("Playback completed.")
                self?.audioEngine?.stop()
            }
            audioPlayerNode.play()
            print("Playback started.")
        } catch {
            print("Error starting audio engine: \(error.localizedDescription)")
        }
    }


}
