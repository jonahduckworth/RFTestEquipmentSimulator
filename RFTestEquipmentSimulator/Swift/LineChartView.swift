//
//  LineChartView.swift
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

import SwiftUI

struct LineChartView: View {
    @Binding var data: [Double]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPos = geometry.size.width * CGFloat(index) / CGFloat(data.count)
                    let yPos = geometry.size.height * CGFloat(1 - data[index])

                    if index == 0 {
                        path.move(to: CGPoint(x: xPos, y: yPos))
                    } else {
                        path.addLine(to: CGPoint(x: xPos, y: yPos))
                    }
                }
            }
            .stroke(Color.blue, lineWidth: 2)
        }
    }
}
