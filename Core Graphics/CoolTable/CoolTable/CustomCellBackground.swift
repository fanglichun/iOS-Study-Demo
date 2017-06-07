//
//  CustomCellBackground.swift
//  CoolTable
//
//  Created by mfang032 on 2017/5/21.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

func drawLinearGradient(context: CGContext, rect: CGRect, startColor: CGColor, endColor: CGColor) {
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let locations: [CGFloat] = [0.0, 1.0]
    let colors = [startColor, endColor]
    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
    
    let startPoint = CGPoint(x: rect.midX, y: rect.minY)
    let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
    context.saveGState()
    context.addRect(rect)
    context.clip()
    if gradient != nil {
        context.drawLinearGradient(gradient!,
                                   start: startPoint,
                                   end: endPoint,
                                   options: CGGradientDrawingOptions(rawValue: 0))
    }
    context.restoreGState()
}

func rectFor1PxStroke(rect: CGRect) ->CGRect {
    return CGRect(x: rect.origin.x + 0.5, y: rect.origin.y + 0.5, width: rect.size.width - 1, height: rect.size.height - 1)
}

func draw1PxStroke(context: CGContext, startPoint: CGPoint, endPoint: CGPoint, color: CGColor) {
    context.saveGState()
    context.setLineCap(CGLineCap.square)
    context.setStrokeColor(color)
    context.setLineWidth(1.0)
    context.move(to: CGPoint(x: startPoint.x + 0.5, y: startPoint.y + 0.5))
    context.addLine(to: CGPoint(x: endPoint.x + 0.5, y: endPoint.y + 0.5))
    context.strokePath()
    context.restoreGState()
}

func drawGlossAndGradient(context: CGContext, rect: CGRect, startColor: CGColor, endColor: CGColor) {
    drawLinearGradient(context: context, rect: rect, startColor: startColor, endColor: endColor)
    let grossColor1 = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 0.35)
    let grossColor2 = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 0.1)
    let topHalf = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height / 2)
    drawLinearGradient(context: context, rect: topHalf, startColor: grossColor1.cgColor, endColor: grossColor2.cgColor)
}


class CustomCellBackground: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let whiteColor = UIColor(colorLiteralRed: 1.0,
                                 green: 1.0,
                                 blue: 1.0,
                                 alpha: 1.0)
        let lightGrayColor = UIColor(colorLiteralRed: 230.0/255.0,
                                     green: 230.0/255.0,
                                     blue: 230.0/255.0,
                                     alpha: 1.0)
        let separatorColor = UIColor(colorLiteralRed: 208.0/255.0,
                                     green: 208.0/255.0,
                                     blue: 208.0/255.0,
                                     alpha: 1.0)
        let paperRect = bounds
        if context != nil {
            drawLinearGradient(context: context!,
                               rect: paperRect,
                               startColor: whiteColor.cgColor,
                               endColor: lightGrayColor.cgColor)
        }
        var strokeRect = paperRect
        strokeRect.size.height -= 1
        strokeRect = rectFor1PxStroke(rect: paperRect.insetBy(dx: 5.0, dy: 5.0))
        context?.setStrokeColor(UIColor.white.cgColor)
        
        context?.setLineWidth(1.0)
        context?.stroke(strokeRect)
        
        let startPoint = CGPoint(x: paperRect.origin.x,
                                 y: paperRect.origin.y + paperRect.size.height - 1)
        let endPoint = CGPoint(x: paperRect.origin.x + paperRect.size.width - 1,
                               y: paperRect.origin.y + paperRect.size.height - 1)
        if context != nil {
            draw1PxStroke(context: context!,
                          startPoint: startPoint,
                          endPoint: endPoint,
                          color: separatorColor.cgColor)
        }
        
    }
}
