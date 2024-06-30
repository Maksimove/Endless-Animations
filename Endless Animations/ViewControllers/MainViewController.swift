//
//  MainViewController.swift
//  Endless Animations
//
//  Created by Evgeniy Maksimov on 23.06.2024.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {
    
    @IBOutlet var precetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var animationView: SpringView!
    
    private var animation = Animation.getRandomAnimation()
    
    private lazy var currentAnimationIndex = Int.random(in: 0..<animation.precet.count)
    private lazy var currentCurveIndex = Int.random(in: 0..<animation.curve.count)
    private lazy var currentForceIndex = Float.random(in: 1...3)
    private lazy var currentDurationIndex = Float.random(in: 1...3)
    private lazy var currentDelayIndex = Float.random(in: 1...2.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @IBAction func startAnimation(_ sender: UIButton) {
        animationView.animation = animation.precet[currentAnimationIndex]
        animationView.curve = animation.curve[currentCurveIndex]
        animationView.force = CGFloat(currentForceIndex)
        animationView.duration = CGFloat(currentDurationIndex)
        animationView.delay = CGFloat(currentDelayIndex)

        animationView.animate()
        
        setUI()
        currentAnimationIndex = Int.random(in: 0..<animation.precet.count)
        sender.setTitle("Run \(animation.precet[currentAnimationIndex])", for: .normal)

        currentCurveIndex = Int.random(in: 0..<animation.curve.count)
        currentForceIndex = Float.random(in: 1...3)
        currentDurationIndex = Float.random(in: 1...3)
        currentDelayIndex = Float.random(in: 1...2.5)

    }
    private func setUI() {
        precetLabel.text = animation.precet[currentAnimationIndex]
        curveLabel.text = animation.curve[currentCurveIndex]
        forceLabel.text = string(for: currentForceIndex)
        durationLabel.text = string(for: currentDurationIndex)
        delayLabel.text = string(for: currentDelayIndex)
        
    }
    private func string(for value: Float) -> String {
        String(format: "%.2f", value)
    }
}
