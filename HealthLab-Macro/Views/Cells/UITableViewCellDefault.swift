//
//  UITableViewCellDefault.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 06/04/22.
//

import SwiftUI

struct UITableViewCellDefault: View {
    
    private let title: String
    private let subtitle: String
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.body)
                Spacer()
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UITableViewCellDefault_Previews: PreviewProvider {
    static var previews: some View {
        UITableViewCellDefault(title: "Title", subtitle: "Subtitle")
    }
}
