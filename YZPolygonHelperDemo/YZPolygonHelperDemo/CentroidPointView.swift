//
//  CentroidPointView.swift
//  YZPolygonHelperDemo
//
//  Created by Yichi on 18/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

import UIKit

class CentroidPointView: UIView {
	
	override func drawRect(rect: CGRect) {
		var ctx:CGContextRef = UIGraphicsGetCurrentContext();
		CGContextAddEllipseInRect(ctx, CGRectInset(rect, 1, 1));
		CGContextSetFillColor(ctx, CGColorGetComponents(UIColor.blueColor().CGColor));
		CGContextFillPath(ctx);
	}

}
