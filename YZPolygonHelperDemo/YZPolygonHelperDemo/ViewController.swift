//
//  ViewController.swift
//  YZPolygonHelperDemo
//
//  Created by Yichi on 16/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var mainView:PolygonView!
	var polygon1:Polygon = Polygon()
	var myTimer:Timer!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		//
		// The previous algorithm wouldn't work if the polygon is a rectangle
		// Testing
		let points =
		[
      CGPoint(x: 10, y: 10),
      CGPoint(x: 50, y: 10),
      CGPoint(x: 50, y: 50),
      CGPoint(x: 10, y: 50),
		]
		let center:CGPoint =
			YZPolygonHelper.findCentroidForNumber(
        ofPoints: points.count,
				
				xAtIndexBlock: { (idx) -> CGFloat in
					
					let point = points[idx]
					return point.x
				},
				
				yAtIndexBlock:{ (idx) -> CGFloat in
					
					let point = points[idx]
					return point.y
				}
		)
		
		print(center)
		
		
		//
		// Set up the polygon view
		self.mainView = PolygonView(frame: self.view.bounds)
		self.view.addSubview(mainView)
		
		var w:CGFloat = self.mainView.bounds.size.width * 0.5
		var h:CGFloat = self.mainView.bounds.size.height * 0.5
		
		for i in 0...7{
			var amount:CGFloat!
			amount = CGFloat(i) * CGFloat(M_PI/4)
			
			let radius = CGFloat(80)
			//CGFloat(UInt(arc4random_uniform(UInt32(80)))) + 20
			
      var controlPoint = ControlPointView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
			var x:CGFloat = w + CGFloat(sinf(Float(amount))) * radius
			var y:CGFloat = h + CGFloat(cosf(Float(amount))) * radius
			
      controlPoint.center = CGPoint(x: x, y: y)
			
			self.polygon1.controlPointViewsArray.append(controlPoint)
		}
		
    self.mainView.addPolygon(polygon: self.polygon1)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
    self.myTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [unowned self] (timer) in
      self.mainView.updatePolygons()
      self.mainView.setNeedsDisplay()
    })
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		myTimer.invalidate()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
