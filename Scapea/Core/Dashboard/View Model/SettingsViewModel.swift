//
//  SettingsViewModel.swift
//  Scapea
//
//  Created by Sanjeev RM on 07/09/23.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    var supportHelpEmail: SupportEmail = SupportEmail(toAddress: "scapea.ltd@gmail.com",
                                                     subject: "Need help [Scapea]",
                                                     messageHeader: "Please describe your needs below")
    
    var supportBugEmail: SupportEmail = SupportEmail(toAddress: "scapea.ltd@gmail.com",
                                                     subject: "Reporting a Bug [Scapea]",
                                                     messageHeader: "Please describe the bug below")
    
    var supportSuggestionEmail: SupportEmail = SupportEmail(toAddress: "scapea.ltd@gmail.com",
                                                            subject: "Providing Suggestions [Scapea]",
                                                            messageHeader: "Please describe your suggestion below")
}
