//
//  ViewController.swift
//  UIPopoverDemo-Swfit
//
//  Created by 贺文杰 on 2019/7/2.
//  Copyright © 2019 贺文杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet var alertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func alertAction(_ sender: Any) {
        print("点击了提示按钮")
    }
    
    @IBAction func menuAction(_ sender: UIButton) {

        let mainSB : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let listVC : UITableViewController = mainSB.instantiateViewController(withIdentifier: "tableviewListVC") as? UITableViewController ?? UITableViewController.init()
        
        //禁止tableView的滚动
        listVC.tableView.isScrollEnabled = false
        //设置大小,这个我们也可以在控制器内部设置，让控制器自己决定
        listVC.preferredContentSize = CGSize.init(width: 200, height: 200)
        //设置style,必须设置UIModalPresentationPopover，才会出来蒙版
        listVC.modalPresentationStyle = UIModalPresentationStyle.popover
        //设置弹出的参照视图，rect参数是以view的左上角为坐标原点（0，0）
        listVC.popoverPresentationController?.sourceView = sender
        //锚点popover的指定视图矩形
        /*
         箭头所指对应的区域，首先根据sourceView，在sourceView描绘出一块区域（CGRect），然后箭头指定这块区域的中心店
         */
        listVC.popoverPresentationController?.sourceRect = CGRect.init(x: sender.frame.width / 2, y: sender.frame.height, width: 0, height: 0)
        //设置弹框的背景颜色
        listVC.popoverPresentationController?.backgroundColor = UIColor.orange
        /*
         这里就是去设置可以穿透的view，就是当menuListVC已经弹出来了，后面有蒙版了，我们点击后面的某个view是可以点击的，并且这个menuListVC不会消失
         */
        listVC.popoverPresentationController?.passthroughViews = [self.alertButton]
        //设置弹出视图的箭头方向
        listVC.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        //设置代理
        listVC.popoverPresentationController?.delegate = self
        self.present(listVC, animated: true) {
            
        }

    }
    
    //MARK: - UIPopoverPresentationControllerDelegate
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController)
    {
        
    }
    
    // Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent the
    // dismissal of the view.
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool
    {
        return true
    }
    
    
    // Called on the delegate when the user has taken action to dismiss the popover. This is not called when the popover is dimissed programatically.
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController)
    {
        
    }
    
    
    // -popoverPresentationController:willRepositionPopoverToRect:inView: is called on your delegate when the
    // popover may require a different view or rectangle.
    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverTo rect: UnsafeMutablePointer<CGRect>, in view: AutoreleasingUnsafeMutablePointer<UIView>)
    {
        
    }
    
    //MARK: -
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}

