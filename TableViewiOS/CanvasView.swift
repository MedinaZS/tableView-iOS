//
//  CanvasView.swift
//  TableViewiOS
//
//  Created by Montserrat Medina on 2023-08-21.
//

import UIKit

class CanvasView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 25, y: 0))
        path.addLine(to: CGPoint(x: 25, y: 90))
        
        UIColor.lightGray.setStroke()
        path.stroke()
    }

}
