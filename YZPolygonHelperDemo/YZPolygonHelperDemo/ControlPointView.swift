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
    gr = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
		self.addGestureRecognizer(gr)
		
		self.backgroundColor = UIColor.clear
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
		commonInit()
	}
	
  override func draw(_ rect: CGRect) {
    guard let ctx = UIGraphicsGetCurrentContext() else { return }
    
    ctx.addEllipse(in: rect.insetBy(dx: 1, dy: 1))
    ctx.setStrokeColor(UIColor.red.cgColor)
    ctx.strokePath()
	}
	
	@objc private func onPan(_ recognizer:UIPanGestureRecognizer) {
		
    let loc = recognizer.location(in: self.superview!)

		self.center = loc
	}

}
