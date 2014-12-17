//
//  CentroidPointView.swift
//  YZPolygonHelperDemo
//
//  Created by Yichi on 18/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

import UIKit

class CentroidPointView: UIView {
	
	func commonInit(){
		self.backgroundColor = UIColor.clearColor()
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
		var ctx:CGContextRef = UIGraphicsGetCurrentContext()
		CGContextAddEllipseInRect(ctx, CGRectInset(rect, 1, 1))
		CGContextSetFillColor(ctx, CGColorGetComponents(UIColor.blueColor().CGColor))
		CGContextFillPath(ctx)
	}

}
