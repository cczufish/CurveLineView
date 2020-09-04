//
//  CurveView.swift
//  333
//
//  Created by yu shuhui on 2020/9/3.
//  Copyright © 2020 yu shuhui. All rights reserved.
//

import UIKit

class CurveView: UIView {

    var aPath:UIBezierPath?
    
    ////     弧线
    open override func draw(_ rect: CGRect) {
        let color = UIColor.red
        color.set() // 设置线条颜色
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        
        aPath = UIBezierPath(arcCenter: center, radius: 10, startAngle: (CGFloat)(0.95*M_PI), endAngle: (CGFloat)(0.05*M_PI), clockwise: false)
        
        aPath?.lineWidth = 2.0 // 线条宽度
        aPath?.stroke() // Draws line 根据坐标点连线，不填充
    }

}
