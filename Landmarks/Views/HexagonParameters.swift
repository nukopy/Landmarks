//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by nukopy on 2021/10/19
//  
//

import CoreGraphics

struct HexagonParameters {
    /*
     Segment は六角形の一辺を表現する 3 つの点（座標）を保持する。
     各辺は前の辺が終わったところから始まり、
     最初の点まで直線で移動し、過度にあるベジエ曲線を越えて 2 つ目のてんまで移動する。
     3 つ目の点は、曲線の形状を制御する。
     */
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    // Add an adjustment value that lets you tune the shape of the hexagon.
    // 六角形の形状を調整するための調整値
    static let adjustment: CGFloat = 0.085
    
    static let segments: [Segment] = [
        /*
         6 つの Segment は六角形の各辺を表している。
         The values are stored as a fraction of a unit square
         having its origin in the upper left, with positive x to the right and positive y down.
         Later, you’ll use these fractions to find the actual points of a hexagon with a given size.
         この値は、左上に原点を持つ、正の x を右に、正の y を下にした単位正方形（1 辺の大きさが 1）の分数として格納されている。
         後で、この分数を使って、指定された大きさの六角形の実際の点を求めることになる。
         */
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
