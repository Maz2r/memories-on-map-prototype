//
//  AddMemoryButtonView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/9/24.
//

import SwiftUI

struct AddMemoryButtonView: View {
    var body: some View {
        Button(action: {
            
        }){
            HStack {
                Image(systemName: "plus")
                    .font(.system(size: 10))
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    .background(Color(.systemGray6))
                    .cornerRadius(7)
                    .padding(.leading, 10)
                VStack(alignment: .leading) {
                    Text("새로운 게시물")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.leading, 4)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            .padding(.vertical, 2)
        }
    }
}

struct AddMemoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemoryButtonView()
    }
}

