//
//  ViewController.swift
//  CatsAffectionLevel
//
//  Created by Labe on 2024/1/10.
//

import UIKit

class ViewController: UIViewController {

    //連接IBOutlet
    @IBOutlet weak var whiteCat: UIImageView!
    @IBOutlet weak var blackCat: UIImageView!
    @IBOutlet weak var love: UIImageView!
    @IBOutlet weak var affectionLevel: UISlider!
    
    //這次初始化面都直接在storyBoard設定好了
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    
    //讓愛心出現的funtion
    func loveAppear() {
        let animatedImage = UIImage.animatedImageNamed("animated-love-image-0489-", duration: 0.3)
        love.image = animatedImage
        love.isHidden = false
    }
    
    //讓貓咪移動的funtion，需要傳入值呼叫
    func catMove(value: Float) {
        
        //讓貓咪的透明度隨數值的變動增加
        blackCat.alpha = CGFloat(value / 175)
        whiteCat.alpha = CGFloat(value / 175)
        
        //設定黑貓的移動，最多移動175
        var blackCatMove = value
        if blackCatMove > 175 {
            blackCatMove = 175
        }
        blackCat.frame.origin.x = CGFloat(30 + blackCatMove)
        
        //設定白貓的移動，最多移動200
        var whiteCatMove = value * 200 / 175 * 2
        if whiteCatMove > 200 {
            whiteCatMove = 200
        }
        whiteCat.frame.origin.x = CGFloat(600 - whiteCatMove)
        
        //設定在貓咪接觸時才出現愛心
        if blackCat.frame.origin.x == 205 &&  whiteCat.frame.origin.x == 400 {
            loveAppear()
        } else {
            love.isHidden = true
        }
    }
    
    //滑動Slider讓貓咪移動
    @IBAction func affectionLevel(_ sender: UISlider) {
        catMove(value: sender.value)
    }
    
    //按下肉泥按鍵讓貓咪靠近，並跟Slider連動，設定數值超過slider數值(175)時，數值維持175，這樣才不會超過Slider的最大值
    @IBAction func meatPasteBT(_ sender: Any) {
        var currentSliderValue = affectionLevel.value
        currentSliderValue += 50.0
        affectionLevel.setValue(currentSliderValue, animated: true)
        if currentSliderValue > 175 {
            currentSliderValue = 175
        }
        catMove(value: currentSliderValue)
    }
}
