//
//  MainTanBarController.swift
//  KSLife
//
//  Created by uareagay on 2019/4/22.
//  Copyright © 2019 cn.edu.twt. All rights reserved.
//

import UIKit

class MainTanBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.isTranslucent = false

        let one = UIViewController()
        one.title = "康食"
        let two = UIViewController()
        two.title = "医服务"
        let three = UIViewController()
        three.title = "打卡"
        let four = UIViewController()
        four.title = "食营圈"
        let five = PersonalInfoViewController()
        five.title = "我的"

        self.setViewControllers([UINavigationController(rootViewController: one), UINavigationController(rootViewController: two), UINavigationController(rootViewController: three), UINavigationController(rootViewController: four), UINavigationController(rootViewController: five)], animated: true)

    }
}
