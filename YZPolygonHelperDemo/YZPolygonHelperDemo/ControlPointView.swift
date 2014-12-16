//
//  ControlPointView.swift
//  YZPolygonHelperDemo
//
//  Created by Yichi on 16/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

import UIKit

class ControlPointView: UIView {

	var gr:UIPanGestureRecognizer!
	
	func commonInit(){
		gr = UIPanGestureRecognizer(target: self, action: "panGestureHandler:")
		self.addGestureRecognizer(gr)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	override init() {
		super.init()
		commonInit()
	}
	
	override func drawRect(rect: CGRect) {
		var ctx:CGContextRef = UIGraphicsGetCurrentContext();
		CGContextAddEllipseInRect(ctx, CGRectInset(rect, 1, 1));
		CGContextSetFillColor(ctx, CGColorGetComponents(UIColor.blueColor().CGColor));
		CGContextSetStrokeColor(ctx, CGColorGetComponents(UIColor.redColor().CGColor))
//		CGContextFillPath(ctx);
		CGContextStrokePath(ctx)
	}
	
	func panGestureHandler(recognizer:UIPanGestureRecognizer){
		
		var loc:CGPoint = recognizer.locationInView(self.superview!)

		self.center = loc
	}

}
