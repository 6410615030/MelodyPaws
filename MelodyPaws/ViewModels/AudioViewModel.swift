//
//  AudioViewModel.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import Foundation
class AudioViewModel: ObservableObject {
    private var audioManager = AudioManager()
<<<<<<< Updated upstream
    
    var tracks: [String] {
        return audioManager.tracks
    }
    
    var currentTrack: Int {
        return audioManager.currentTrackIndex
    }
    
    func play(trackIndex: Int) {
        audioManager.changeTrack(trackIndex: trackIndex)
=======

    func play() {
        audioManager.startPlayback(trackIndex: 0)
    }

    func next() {
        audioManager.nextTrack()
>>>>>>> Stashed changes
    }
}
