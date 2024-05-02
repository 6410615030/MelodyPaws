//
//  AudioTuneViewModel.swift
//  MelodyPaws
//
//  Created by Babypowder on 2/5/2567 BE.
//

import Foundation

class AudioTuneViewModel: ObservableObject {
    private var audioTunerManager = AudioTunerManager()
    @Published var message: String = ""
    
    func startRecordingTapped() {
        audioTunerManager.requestMicrophoneAccess()
        audioTunerManager.startRecording()
        message = "Say something!"
    }
    
    func stopRecordingTapped() {
        audioTunerManager.stopRecording()
        audioTunerManager.tunePitch()
        audioTunerManager.playTunedSound()
    }

}
