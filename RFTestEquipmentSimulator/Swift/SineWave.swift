//
//  SineWave.swift
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

import SwiftUI

struct SineWave: Shape {
    let frequency: Double
    let amplitude: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = Double(rect.width)
        let height = Double(rect.height)
        let midHeight = height / 2

        let scaleX = width / (2 * Double.pi / frequency)
        let scaleY = midHeight * amplitude

        let xStep = width / 150

        path.move(to: CGPoint(x: 0, y: midHeight))

        for x in stride(from: 0, through: width, by: xStep) {
            let y = midHeight - scaleY * sin(frequency * x / scaleX)
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
}
