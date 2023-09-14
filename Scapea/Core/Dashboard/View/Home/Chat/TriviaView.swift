//
//  TriviaView.swift
//  Scapea
//
//  Created by Sanjeev RM on 10/09/23.
//

import SwiftUI

struct TriviaView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            Image(systemName: "text.bubble")
                .font(.largeTitle.bold())
                .navigationTitle("Trivia")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            homeViewModel.showTriviaView = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(HomeViewModel())
    }
}
