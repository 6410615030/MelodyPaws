//
//  AudioManager.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import Foundation
import AVFoundation

class AudioManager: NSObject, AVAudioPlayerDelegate {
    var player: AVAudioPlayer?
    let tracks = ["track1"]
    var currentTrackIndex = 0

    override init() {
        super.init()
        setupAudioSession()
    }
    
    func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category. Error: \(error)")
        }
    }

    func startPlayback(trackIndex: Int) {
        guard trackIndex < tracks.count else { return }
        let trackName = tracks[trackIndex]
        guard let url = Bundle.main.url(forResource: trackName, withExtension: "mp3") else {
            print("Audio file not found.")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.numberOfLoops = -1  // Loop indefinitely
            player?.play()
        } catch {
            print("Failed to initialize player. Error: \(error)")
        }
    }

    func nextTrack() {
        currentTrackIndex = (currentTrackIndex + 1) % tracks.count
        startPlayback(trackIndex: currentTrackIndex)
    }
}
