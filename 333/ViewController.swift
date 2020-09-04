//
//  ViewController.swift
//  333
//
//  Created by yu shuhui on 2020/9/3.
//  Copyright © 2020 yu shuhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 绘制运动的路线
        let path = UIBezierPath(arcCenter: CGPoint(x: 12, y: 20), radius: 12, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)
        path.addLine(to: CGPoint(x: 24, y: 20))
        path.addArc(withCenter: CGPoint(x: 96, y: 20), radius: 12, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)
        path.lineWidth = 2
        
        //绘制运动轨迹
        let pathLayer = CAShapeLayer()
        pathLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        pathLayer.path = path.cgPath
        pathLayer.strokeColor = UIColor.purple.cgColor
        pathLayer.lineWidth = 1
        pathLayer.fillColor = nil
        
        testView.layer.addSublayer(pathLayer)
        view.addSubview(testView)
        maskView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 100))
        // 给视图层添加maskview
        let padth = UIBezierPath(rect: maskView.bounds)
        maskLayer.path = padth.cgPath
        maskView.layer.addSublayer(maskLayer)
        testView.mask = maskView
        
    }
    lazy var maskView = UIView()
    //绘制路线的图层
    var pathLayer:CAShapeLayer!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 移动 maskview
        if self.maskView.frame.origin.x == 84 {
            UIView.animate(withDuration: 0.4, animations: {
                self.maskView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            }) { (_) in
            }
        }else{
            UIView.animate(withDuration: 0.4, animations: {
                self.maskView.frame = CGRect(x: 84, y: 0, width: 100, height: 100)
            }) { (_) in
            }
        }
        
        
    }
    lazy var testView: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 108, height: 100))
        view.backgroundColor = .clear
        return view
    }()
    lazy var maskLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        return layer
    }()
}
