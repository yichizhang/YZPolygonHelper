//
//  Polygon.swift
//  YZPolygonHelperDemo
//
//  Created by Yichi on 18/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

import UIKit

class Polygon: NSObject {

	var controlPointViewsArray:Array<ControlPointView> = []
	var centroidPointView:CentroidPointView = CentroidPointView(frame: CGRectMake(0, 0, 20, 20))
	
	func addToView(view:UIView){
		
		for controlPointView:ControlPointView in self.controlPointViewsArray {
			view.addSubview(controlPointView)
		}
		
		self.updateCentroid()
		view.addSubview(self.centroidPointView)
	}
	
	func updateCentroid(){
		
		self.centroidPointView.center =
		YZPolygonHelper.findCentroidForNumberOfPointsNewAlgorithm(
			self.controlPointViewsArray.count,
			
			xAtIndexBlock: { (UInt idx) -> CGFloat in
			
				let view:ControlPointView = self.controlPointViewsArray[idx]
				return view.center.x
			},
			
			yAtIndexBlock:{ (UInt idx) -> CGFloat in
				
				let view:ControlPointView = self.controlPointViewsArray[idx]
				return view.center.y
			}
		)
		
	}
	
}
