//
//  BadgeBackgroundView.swift
//  Landmarks
//
//  Created by nukopy on 2021/10/19
//  
//

import SwiftUI

struct BadgeBackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                path.move(
                    to: CGPoint(
                        x: width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x,
                            y: width * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x,
                            y: width * segment.control.y
                        )
                    )
                }
            }
            .fill(Color.black)
        }
//        .padding()
    }
}

struct BadgeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackgroundView()
    }
}
