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
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
	
	func addPolygon(polygon:Polygon){
		
		self.polygonsArray.append(polygon)
		
	}

}
