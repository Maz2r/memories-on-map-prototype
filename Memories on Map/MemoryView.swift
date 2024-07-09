//
//  MemoryView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/7/24.
//

import SwiftUI

struct MemoryView: View {
    let memory: Memory

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Images
                if !memory.images.isEmpty {
                    GeometryReader { geometry in
                        ScrollView(.horizontal, showsIndicators: false) {
                            TabView {
                                ForEach(memory.images, id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 300, height: 400)
                                        .clipped()
                                        .cornerRadius(10)
                                        .frame(width: geometry.size.width, height: 400) // Center the image
                                }
                            }
                            .frame(width: 360, height: 400) // Ensure the TabView has the same height as the images
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        }
                    }
                    .frame(height: 400)
                }

                // Date
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                    Text("Date: \(formattedDate(memory.date))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding([.leading, .trailing])

                // Weather
                HStack {
                    Image(systemName: "cloud.sun")
                        .foregroundColor(.gray)
                    Text("Weather: \(memory.weather)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding([.leading, .trailing])

                // Description
                Text(memory.description)
                    .font(.body)
                    .padding([.leading, .trailing, .bottom])
            }
            .padding()
        }
        .navigationBarTitle("Memory Details", displayMode: .inline)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct MermoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(memory: Memory.sampleData.first!)
    }
}
