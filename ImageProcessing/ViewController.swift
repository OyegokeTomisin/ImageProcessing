//
//  ViewController.swift
//  ImageProcessing
//
//  Created by OYEGOKE TOMISIN on 25/01/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UIImageView!
    @IBOutlet weak var RSlider: UISlider!
    @IBOutlet weak var GSlider: UISlider!
    @IBOutlet weak var BSlider: UISlider!
    
    var R: Int = 0
    var G: Int = 0
    var B: Int = 0
    let img_name = "pokemon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.image = UIImage(named: img_name)
    }
    
    @IBAction func reloadImageButtonTapped(_ sender: Any) {
        display.image = UIImage(named: img_name)
    }
    
    @IBAction func RSliderValueChanged(_ sender: UISlider) {
        R = Int(sender.value)
    }
    
    @IBAction func GSliderValueChanged(_ sender: UISlider) {
        G = Int(sender.value)
    }
    
    @IBAction func BSliderValueChanged(_ sender: UISlider) {
        B = Int(sender.value)
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        processImage(with: (r: R, g: G, b: B))
    }
    
    func processImage(with rgbValues: (r: Int, g: Int, b:Int)){
        
        if let image = UIImage(named: img_name){
            DispatchQueue(label: "Processing image").async {
                let newImage = processTask(with: image, and: rgbValues).toUIImage()
                DispatchQueue.main.async {
                    self.display.image = newImage
                }
            }
        }
    }
}

