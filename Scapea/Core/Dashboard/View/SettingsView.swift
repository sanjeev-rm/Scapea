//
//  SettingsView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.openURL) var openURL
    
    @StateObject var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Contact") {
                    
                    Button {
                        // Get help email
                        settingsViewModel.supportHelpEmail.send(openURL: openURL)
                    } label: {
                        HStack(spacing: 22) {
                            Image(systemName: "waveform.path.ecg")
                                .foregroundColor(Color(uiColor: .tertiaryLabel))
                                .font(.title3)
                            Text("Help")
                        }
                    }
                    
                    Button {
                        // Report a bug mail
                        settingsViewModel.supportBugEmail.send(openURL: openURL)
                    } label: {
                        HStack(spacing: 22) {
                            Image(systemName: "ant.fill")
                                .foregroundColor(Color(uiColor: .tertiaryLabel))
                                .font(.title3)
                            Text("Report a bug")
                        }
                    }
                    
                    Button {
                        // Give a suggestion email
                        settingsViewModel.supportSuggestionEmail.send(openURL: openURL)
                    } label: {
                        HStack(spacing: 22) {
                            Image(systemName: "pencil.line")
                                .foregroundColor(Color(uiColor: .tertiaryLabel))
                                .font(.title3)
                            Text("Give a suggestion")
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AuthenticationViewModel())
    }
}
