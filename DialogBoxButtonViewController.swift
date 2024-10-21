//
//  DialogBoxButtonViewController.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class DialogBoxButtonViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel?

    lazy var button: TwoColorButton = {
        let result = TwoColorButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    let model: DialogBoxButtonModel
    init(model: DialogBoxButtonModel, nibName: String) {
        self.model = model
        super.init(nibName: nibName, bundle: nil)
        
        self.loadViewIfNeeded()
        if let label = label {
            label.text = model.title
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let selfView = self.view {
            selfView.addSubview(button)
            selfView.addConstraints([
                button.leftAnchor.constraint(equalTo: selfView.leftAnchor),
                button.rightAnchor.constraint(equalTo: selfView.rightAnchor),
                button.topAnchor.constraint(equalTo: selfView.topAnchor),
                button.bottomAnchor.constraint(equalTo: selfView.bottomAnchor)
            ])
        }
        button.addTarget(self, action: #selector(Self.clickButton(sender:)), for: .touchUpInside)
    }
    
    @objc func clickButton(sender: UIButton) {
        model.action?()
    }

    deinit {
        print("~DialogBoxButtonViewController")
    }
}
