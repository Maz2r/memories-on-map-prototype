//
//  RecentMemoryView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/9/24.
//

import SwiftUI

struct RecentMemoryView: View {
    var icon: String
    var iconColor: Color
    var memory: Memory
    @Binding var selectedMemory: Memory?

    var body: some View {
        Button(action: {
            selectedMemory = memory
        }) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(iconColor)
                    .padding(.leading, 10)
                VStack(alignment: .leading) {
                    Text(memory.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Text(memory.description)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .lineLimit(1)
                }
                .padding(.leading, 4)
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

struct RecentMemoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecentMemoryView(icon: "mappin.and.ellipse.circle.fill", iconColor: .red, memory: Memory.sampleData[0], selectedMemory: .constant(nil))
    }
}
