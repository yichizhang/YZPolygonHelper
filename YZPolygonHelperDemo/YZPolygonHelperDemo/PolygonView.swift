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

	override func drawRect(rect: CGRect) {
		
		/*
		Something's wrong!!!
		*/
		super.drawRect(rect)
		
		let path = UIBezierPath()
		
		var idx:Int = 0
		for polygon:Polygon in self.polygonsArray {
			for pointView:ControlPointView in polygon.controlPointViewsArray {
				if (idx == 0){
					path.moveToPoint(pointView.center)
				}else{
					path.addLineToPoint(pointView.center)
				}
				idx++
			}
		}
		
		path.closePath()
		UIColor.purpleColor().setStroke()
		path.stroke()
	}
	
	func updatePolygons() {
		
		for polygon:Polygon in self.polygonsArray {
			polygon.updateCentroid()
		}
		
	}
	
	func addPolygon(polygon:Polygon){
		
		self.polygonsArray.append(polygon)
		polygon.addToView(self)
	}

}
