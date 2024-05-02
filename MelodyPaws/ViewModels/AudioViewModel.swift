//
//  AudioViewModel.swift
//  MelodyPaws
//
//  Created by Babypowder on 1/5/2567 BE.
//

import Foundation
class AudioViewModel: ObservableObject {
    private var audioManager = AudioManager()

    func play() {
        audioManager.startPlayback(trackIndex: 0)
    }

    func next() {
        audioManager.nextTrack()
    }
}
