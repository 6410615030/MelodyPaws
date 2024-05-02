//
//  AudioViewModel.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import Foundation
class AudioViewModel: ObservableObject {
    private var audioManager = AudioManager()
    
    var tracks: [String] {
        return audioManager.tracks
    }
    
    var currentTrack: Int {
        return audioManager.currentTrackIndex
    }
    
    func play() {
        audioManager.changeTrack(trackIndex: currentTrack)
    }

    func changeTrack(trackIndex: Int) {
        audioManager.changeTrack(trackIndex: trackIndex)
    }
}
