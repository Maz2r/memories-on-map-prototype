//
//  Memory.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/7/24.
//

import Foundation
import CoreLocation
import SwiftUI

struct Memory: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
    let images: [String] // Assuming image names or URLs
    let date: Date
    let weather: String
    let description: String
    
    static func ==(lhs: Memory, rhs: Memory) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let sampleData = [
        Memory(
            title: "영일대해수욕장",
            coordinate: CLLocationCoordinate2D(latitude: 36.0561507, longitude: 129.3781717),
            images: ["youngildae_0", "youngildae_1", "youngildae_2"], // Replace with actual image names or URLs
            date: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 30)) ?? Date(),
            weather: "Cloudy",
            description: "생각치도 못한 힐링 ☁️🌊"
        ),
        Memory(
            title: "체인지업 그라운드",
            coordinate: CLLocationCoordinate2D(latitude: 36.012187, longitude: 129.3238989),
            images: ["cg_0", "cg_1"], // Replace with actual image names or URLs
            date: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 2)) ?? Date(),
            weather: "Rainy",
            description: "점심 먹고 비오는 날 산책 🌧️🌂"
        ),
        Memory(
            title: "쌍용사거리",
            coordinate: CLLocationCoordinate2D(latitude: 36.0164883, longitude: 129.3530363),
            images: ["ssangsa_0", "ssangsa_1", "ssangsa_2", "ssangsa_3"], // Replace with actual image names or URLs
            date: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 5)) ?? Date(),
            weather: "Sunny",
            description: "오랜만에 쌍사에서 만취 🍷😵"
        )
    ]
}
