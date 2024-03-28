//
//  THDissolveBanner.swift
//  THDissolveBanner
//
//  Created by TAEHUN YU on 23/02/2020.
//  Copyright © 2020 yutaehun. All rights reserved.
//

import UIKit

open class THDisolveBanner: UIView {
    
    private var bannerImage = [Any]()
    private var bannerStr = [String]()
    private var timer: Timer?
    private var num: Int = 0
    private var numNow: Int = 0
    
    open var timerInterval: Double = 5.0                     // (세팅가능) 움직이는 인터벌
    open var disolveInterval: Double = 1.0                   // (세팅가능) 디졸브 인터벌
    open var rangeMove: CGFloat = 100                        // (세팅가능) 움직이는 범위
    open var textColor: UIColor = UIColor.black              // (세팅가능) 텍스트 색상
    open var textSize: CGFloat = 22.0                        // (세팅가능) 텍스트 크기
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        
        //-Mark: disappear
        if newWindow == nil {
            stopAnimate()
            
        //-Mark: appear
        } else {
            if timer == nil {
                startAnimate()
            }
        }
    }
    
    // 이미지를 세팅한다.
    open func setImage(images: [Any], str: [String]) {
        
        if images.isEmpty == false && images.count == str.count {
            bannerImage.removeAll()
            bannerImage = images
            
            bannerStr.removeAll()
            bannerStr = str
            
            num = (bannerImage.count) - 1
        }
    }
    
    // 애니메이션을 시작한다.
    open func startAnimate() {

        if bannerImage.isEmpty == false {
            autoAnimate()
            timer = Timer()
            timer = Timer.scheduledTimer(timeInterval: (timerInterval - disolveInterval),
                                         target: self,
                                         selector: #selector(autoAnimate),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    // 애니메이션을 종료한다.
    open func stopAnimate() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func autoAnimate() {
        
        DispatchQueue.main.async {
            self.moveImage(image: self.bannerImage[self.numNow], str: self.bannerStr[self.numNow])
        }
        
        if numNow < num {
            numNow = numNow + 1
        } else {
            numNow = 0
        }
    }
    
    private func moveImage(image: Any?, str: String?) {
        
        let imgs: UIImage? = {
            if let urlString = image as? String {
                let imgUrl = URL(string: urlString)!
                if let req = try? Data(contentsOf: imgUrl) {
                    return UIImage(data: req)
                }
            } else if let uiImage = image as? UIImage {
                return uiImage
            }
            return nil
        }()
        
//        if let img = image {
        if let img = imgs {

            let imgWidth = self.frame.size.width + rangeMove
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: imgWidth, height: self.frame.size.height))
            imgView.frame.origin.x = 0
            imgView.alpha = 0.2
            imgView.image = img
            self.addSubview(imgView)
            
            UIView.animate(withDuration: disolveInterval) {
                imgView.alpha = 1.0
            }
            
            UIView.animate(withDuration: timerInterval, animations: {
                imgView.frame.origin.x = (0 - self.rangeMove)
            }) { (finished) in
                if (finished) {
                    imgView.removeFromSuperview()
                }
//                print(finished)
            }
        }
        
        if let msg = str {
            let newText = msg.replacingOccurrences(of: "<br />", with: "\n")
//            print(newText)
            
            let msgView = UILabel(frame: CGRect(x: 30, y: 55, width: (self.frame.size.width - 60), height: 100))
            msgView.alpha = 0.2
            msgView.numberOfLines = 2
            msgView.lineBreakMode = .byWordWrapping
            msgView.font = UIFont.systemFont(ofSize: textSize)
            msgView.textColor = textColor
            msgView.text = newText
            self.addSubview(msgView)
            
            UIView.animate(withDuration: timerInterval, animations: {
                msgView.alpha = 1.0
            }) { (finished) in
                if (finished) {
                    msgView.removeFromSuperview()
                }
            }
        }
    }
}
