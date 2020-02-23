//
//  ViewController.swift
//  THDissolveBanner
//
//  Created by TAEHUN YU on 23/02/2020.
//  Copyright © 2020 yutaehun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewDisolveImage: THDisolveBanner!
    
    
    let images = ["https://cafeptthumb-phinf.pstatic.net/MjAyMDAyMjNfODEg/MDAxNTgyNDQxNjYyOTEx.TSVQm810JzVPIqjAqguE6NwIKf5INBcSSwM0VvXJCFQg.Vbz9nDfSjgzcOA7QSXuC4wTXB4Tl5AemHwAc7Hzcp98g.JPEG/IMG_9885.JPG?type=w740",
    "https://cafeptthumb-phinf.pstatic.net/MjAyMDAyMjNfNyAg/MDAxNTgyNDI0NTA4NDc3.3gruzua42DSO3Y4FZdAO79bySeMKirEiUQOX3cuQYQUg.EEhqi6dTEfNTZTy_nrV7VSCArqVU9iztETi4F2wuTb4g.JPEG/externalFile.jpg?type=w740",
    "https://cafeptthumb-phinf.pstatic.net/MjAyMDAyMjNfMTU0/MDAxNTgyNDI0NTA4NTc5.Fv88x3YTLfS8U80QEXGpbwomFjpuK8mWizJgmSvpZVIg.TfTUwlkrunl337UCxIMG6xbfwDUAeSRPgxQySRZJSVYg.JPEG/externalFile.jpg?type=w740",
    "https://cafeptthumb-phinf.pstatic.net/MjAyMDAyMjNfMTEg/MDAxNTgyNDIzNTM5MzM5.S2fkPxIZX3uN5VbPkAXAlg4FRf6-uy2zqZ9Q0AeFF_wg.Cj4mY7a5YJrEcE1MK5vBlHYpVRi7sZfj3WIUtonzKOYg.JPEG/externalFile.jpg?type=w740"]
    let str = ["1번 이미지", "2번 이미지", "3번 이미지", "4번 이미지"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewDisolveImage.setImage(images: images, str: str)
        self.viewDisolveImage.stopAnimate()
        self.viewDisolveImage.startAnimate()
    }


}

