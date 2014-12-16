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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		mainView = PolygonView(frame: self.view.bounds)
		self.view.addSubview(mainView)
		
		var w:CGFloat = mainView.bounds.size.width * 0.5
		var h:CGFloat = mainView.bounds.size.height * 0.5
		
		for i in 0...7{
			var amount:CGFloat!
			amount = CGFloat(i) * CGFloat(M_PI/4)
			
			var controlPoint = ControlPointView(frame: CGRectMake(0.0, 0.0, 20.0, 20.0))
			controlPoint.backgroundColor = UIColor.clearColor()
			
			var x:CGFloat = w + CGFloat(sinf(Float(amount))) * 80
			var y:CGFloat = h + CGFloat(cosf(Float(amount))) * 80
			
			controlPoint.center = CGPointMake(x, y)
			mainView.addSubview(controlPoint)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

