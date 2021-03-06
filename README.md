YZPolygonHelper
===============

A few class methods to help working with polygons; such as: find the center (centroid) of a polygon; test if a point is with inside a polygon or not.

![Screenshot](https://raw.githubusercontent.com/yichizhang/YZPolygonHelper/master/demogif1.gif)

Examples

```swift
	func updateCentroid(){
		
		self.centroidPointView.center =
		YZPolygonHelper.findCentroidForNumberOfPoints(
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
```

```swift
	var result:Bool =
	YZPolygonHelper.isPointContained(
		point,
		inNumberOfPoints: pointsArray.count,
		xAtIndexBlock: { (idx:Int) -> CGFloat in
		
			return pointsArray[idx].x
		},
		yAtIndexBlock: { (idx:Int) -> CGFloat in
		
			return pointsArray[idx].y
		}
	)
```

## Acknowledgements/ Copyright information

###'Find Centroid'

Algorithm by Paul Bourke
http://paulbourke.net/geometry/polygonmesh/

Adapted from the C code provided by 'squeamish ossifrage'
http://stackoverflow.com/users/1679849/squeamish-ossifrage

From page
http://stackoverflow.com/questions/19766485/how-to-calculate-centroid-of-polygon-in-c