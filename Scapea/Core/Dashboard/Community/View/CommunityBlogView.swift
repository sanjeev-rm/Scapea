//
//  CommunityPostView.swift
//  Scapea
//
//  Created by Sanjeev RM on 21/03/24.
//

import SwiftUI

struct CommunityBlogView: View {
    
    var blog: Blog = SAMPLE_BLOGS[0]
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            
            blog.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 64, height: 150)
                .cornerRadius(16)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(blog.title)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                Text(blog.dateCreated)
                    .font(.subheadline.bold())
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 8)
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    CommunityBlogView()
}
