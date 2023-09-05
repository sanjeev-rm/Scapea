//
//  SettingsView.swift
//  Scapea
//
//  Created by Sanjeev RM on 06/09/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .font(.system(size: 27, weight: .ultraLight, design: .monospaced))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AuthenticationViewModel())
    }
}
