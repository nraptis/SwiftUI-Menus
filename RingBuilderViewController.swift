//
//  RingBuilderViewController.swift
//  Manifold
//
//  Created by Nicky Taylor on 8/3/24.
//

import UIKit

class RingBuilderViewController: UIViewController {
    
    static var height = CGFloat(192.0)
    
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var containerView2: UIView!
    
    @IBOutlet weak var ringBuilderRingView: RingBuilderRingView!
    
    @IBOutlet weak var buttonReset: UIButton!
    
    @IBOutlet weak var buttonNumberOfRingsSubtract: UIButton!
    
    @IBOutlet weak var labelDigit: UILabel!
    @IBOutlet weak var labelInstruction: UILabel!
    
    @IBOutlet weak var buttonNumberOfRingsAdd: UIButton!
    
    //weak var timer: Timer?
    
    //weak var ringBuilder: RingBuilder?
    //weak var jiggle: Jiggle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelInstruction.text = GeneralStringLibrary.generalTextNumberOfGuides()
        
        refreshLabelDigit()
        
        ringBuilderRingView.backgroundColor = UIColor.clear
        
        containerView1.backgroundColor = UIColor.clear
        containerView2.backgroundColor = UIColor.clear
        
        buttonReset.backgroundColor = UIColor.clear
        buttonReset.layer.cornerRadius = 8.0
        buttonReset.clipsToBounds = true
        buttonReset.layer.borderWidth = 1.0
        buttonReset.layer.borderColor = DialogTheme.dialogTintRegular.cgColor
        
        buttonNumberOfRingsSubtract.backgroundColor = UIColor.clear
        buttonNumberOfRingsSubtract.layer.cornerRadius = 8.0
        buttonNumberOfRingsSubtract.clipsToBounds = true
        buttonNumberOfRingsSubtract.layer.borderWidth = 1.0
        buttonNumberOfRingsSubtract.layer.borderColor = DialogTheme.dialogTintRegular.cgColor
        
        buttonNumberOfRingsAdd.backgroundColor = UIColor.clear
        buttonNumberOfRingsAdd.layer.cornerRadius = 8.0
        buttonNumberOfRingsAdd.clipsToBounds = true
        buttonNumberOfRingsAdd.layer.borderWidth = 1.0
        buttonNumberOfRingsAdd.layer.borderColor = DialogTheme.dialogTintRegular.cgColor
    }
    
    @IBAction func clickNumberOfRingsSubtract(_ sender: Any) {
        ringBuilderRingView.ringBuilderWidget.set(numberOfRings: ringBuilderRingView.ringBuilderWidget.numberOfRings - 1)
        refreshLabelDigit()
        ringBuilderRingView.setNeedsDisplay()
        ringBuilderRingView.ringBuilderWidget.save()
    }
    
    @IBAction func clickNumberOfRingsAdd(_ sender: Any) {
        ringBuilderRingView.ringBuilderWidget.set(numberOfRings: ringBuilderRingView.ringBuilderWidget.numberOfRings + 1)
        refreshLabelDigit()
        ringBuilderRingView.setNeedsDisplay()
        ringBuilderRingView.ringBuilderWidget.save()
    }
    
    @IBAction func clickReset(_ sender: Any) {
        print("Reset!!!")
        ringBuilderRingView.ringBuilderWidget.set(angle: 0.0)
        ringBuilderRingView.ringBuilderWidget.set(magnitude: 0.0)
        ringBuilderRingView.setNeedsDisplay()
    }
    
    func refreshLabelDigit() {
        labelDigit.text = "\(ringBuilderRingView.ringBuilderWidget.numberOfRings)"
    }
    
}
