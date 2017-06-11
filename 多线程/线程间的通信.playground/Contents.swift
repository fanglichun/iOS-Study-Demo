//: Playground - noun: a place where people can play

import UIKit

import Foundation

let imageView = UIImageView(frame: CGRect(x: 16, y: 20, width: 200, height: 200))

func getImage() {
    
    let  queue: OperationQueue = OperationQueue()
    queue.addOperation { 
        guard let url = URL(string: "http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=157484237350&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=4271053251%2C2424464488&os=2375022793%2C1835605452&simid=4247939438%2C550168575&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fpic55.nipic.com%2Ffile%2F20141208%2F19462408_171130083000_2.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bgtrtv_z%26e3Bv54AzdH3Fzi7wgptAzdH3F8c8n9d9_d_z%26e3Bip4s&gsm=0") else { return }
        do {
            let data =  try Data(contentsOf: url)
            let image = UIImage(data: data)
            OperationQueue.main.addOperation({
                imageView.image = image
            })
        } catch {
            
        }
       
        
    }
}
