//
//  trackView.swift
//  MelodyPaws
//
//  Created by Babypowder on 2/5/2567 BE.
//

import SwiftUI

struct TrackView: View {
    @StateObject var viewModel = AudioViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.tracks.indices, id: \.self) { index in
                Button("Track \(index)") {
                    viewModel.changeTrack(trackIndex: index)
                }
            }
        }
    }
}

#Preview {
    TrackView()
}
