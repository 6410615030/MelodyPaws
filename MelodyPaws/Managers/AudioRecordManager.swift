//
//  AudioTuneManager.swift
//  MelodyPaws
//
//  Created by Babypowder on 2/5/2567 BE.
//

import Foundation
import AVFoundation
import AVFAudio

class AudioRecordManager {
    var audioRecorder: AVAudioRecorder?
    var audioFilename: URL?
    
    init() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        audioFilename = paths[0].appendingPathComponent("audioToAnalyze.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename!, settings: settings)
            audioRecorder?.prepareToRecord()
        } catch {
            print("Failed to set up the audio recorder: \(error)")
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
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioRecorder?.record()
        } catch {
            print("Audio recording failed: \(error)")
        }
    }

    func stopRecording() {
        audioRecorder?.stop()
        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print("Failed to deactivate audio session: \(error)")
        }
    }
    
    
    func uploadRecording(completion: @escaping (Data) -> Void) {
        guard let filePath = audioFilename?.path else {
            return
        }
    }

    
}
