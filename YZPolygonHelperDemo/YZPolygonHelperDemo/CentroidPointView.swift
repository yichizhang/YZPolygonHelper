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
    ctx.setFillColor(UIColor.blue.cgColor)
    ctx.fillPath()
	}

}
