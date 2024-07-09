//
//  RecentMemoryListView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/9/24.
//

import SwiftUI

struct RecentMemoryListView: View {
    @Binding var selectedMemory: Memory?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("최근 게시물")
                    .font(.headline)
                Spacer()
                Text("더 보기")
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)

            VStack {
                RecentMemoryView(icon: "mappin.and.ellipse.circle.fill", iconColor: .red, memory: Memory.sampleData[2], selectedMemory: $selectedMemory)
                RecentMemoryView(icon: "mappin.and.ellipse.circle.fill", iconColor: .red, memory: Memory.sampleData[1], selectedMemory: $selectedMemory)
                RecentMemoryView(icon: "mappin.and.ellipse.circle.fill", iconColor: .red, memory: Memory.sampleData[0], selectedMemory: $selectedMemory)
                AddMemoryButtonView()
            }
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

struct RecentMemoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentMemoryListView(selectedMemory: .constant(nil))
    }
}
