//
//  UITableViewCellSubtitle.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 05/04/22.
//

import SwiftUI

struct UITableViewCellSubtitle: View {
    
    private var imageName: String?
    private var imageUrl: String?
    private var title: String
    private var subtitle: String?
    
    init(imageName: String, title: String, subtitle: String? = nil) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
    }
    
    init(imageUrl: String, title: String, subtitle: String? = nil) {
        self.imageUrl = imageUrl
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        HStack {
            if imageName != nil {
                Image(imageName!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else if imageUrl != nil {
                AsyncImage(url: URL(string: imageUrl!)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } placeholder: {
                     ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                    .lineLimit(1)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
            }
            Spacer()
        }.padding(8)
    }
}

struct UITableViewCellSubtitle_Previews: PreviewProvider {
    static var previews: some View {
        UITableViewCellSubtitle(imageUrl: "https://spoonacular.com/recipeImages/658277-312x231.jpg", title: "Title", subtitle: "Subtitle").previewLayout(.sizeThatFits)
    }
}
