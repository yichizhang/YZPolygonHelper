//
//  PolygonView.swift
//  YZPolygonHelperDemo
//
//  Created by Yichi on 16/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

import UIKit

class PolygonView: UIView {

	var polygonsArray:Array<Polygon> = []

	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		UIColor.white.setFill()
		var ctx = UIGraphicsGetCurrentContext()
    ctx?.fill(rect)
		
		let path = UIBezierPath()
		
		var idx = 0
		for polygon:Polygon in self.polygonsArray {
			for pointView:ControlPointView in polygon.controlPointViewsArray {
				if (idx == 0){
          path.move(to: pointView.center)
				} else {
          path.addLine(to: pointView.center)
				}
				idx += 1
			}
		}
		
		path.close()
		UIColor.purple.setStroke()
		path.stroke()
	}
	
	func updatePolygons() {
		
		for polygon:Polygon in self.polygonsArray {
			polygon.updateCentroid()
		}
		
	}
	
	func addPolygon(polygon:Polygon){
		
		self.polygonsArray.append(polygon)
		polygon.addToView(view: self)
	}

}
