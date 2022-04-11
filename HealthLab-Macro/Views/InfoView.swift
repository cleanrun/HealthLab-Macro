//
//  InfoView.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 03/04/22.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Image("info-1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(InfoText.title)
                            .font(.title.bold())
                        Text(InfoText.titleDesc)
                            .font(.body)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(InfoText.weightLossTitle)
                                .font(.title3.bold())
                            Text(InfoText.weightLossDesc)
                                .font(.body)
                            
                            Text(InfoText.heartHealthTitle)
                                .font(.title3.bold())
                            Text(InfoText.heartHealthDesc)
                                .font(.body)
                        }
                        
                        Image("info-2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(InfoText.strongBonesAndTeethTitle)
                                .font(.title3.bold())
                            Text(InfoText.stringBonersAndTeethDesc)
                                .font(.body)
                            
                            Text(InfoText.betterMoodTitle)
                                .font(.title3.bold())
                            Text(InfoText.betterMoodDesc)
                                .font(.body)
                            
                            Text(InfoText.improvedMemoryTitle)
                                .font(.title3.bold())
                            Text(InfoText.improvedMemoryDesc)
                                .font(.body)
                        }
                        
                        VStack{}
                            .frame(height: 30)
                        
                    }
                }.padding(.horizontal, 16)
            }.navigationTitle("Info")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Link("Source", destination: URL(string: InfoText.sourceUrl)!)
                    }
                }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
