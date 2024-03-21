//
//  CommunityView.swift
//  Scapea
//
//  Created by Sanjeev RM on 20/03/24.
//

import SwiftUI

struct CommunityView: View {
    
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(SAMPLE_BLOGS, id: \.title) { blog in
                    Button {
                        openUrl(URL(string: blog.link)!)
                    } label: {
                        CommunityBlogView(blog: blog)
                            .padding(.bottom)
                    }
                }
            }
            .padding()
            .scrollIndicators(.hidden)
            .background(APP_BACKGROUND_VIEW)
            .navigationTitle("Community")
        }
    }
}

#Preview {
    CommunityView()
}
