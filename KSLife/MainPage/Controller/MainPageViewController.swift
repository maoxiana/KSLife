//
//  MainPageViewController.swift
//  KSLife
//
//  Created by uareagay on 2019/4/26.
//  Copyright © 2019 cn.edu.twt. All rights reserved.
//

import UIKit
import MJRefresh

class MainPageViewController: UIViewController {

    fileprivate var tableView: UITableView!
    fileprivate var collectionView: UICollectionView!

    fileprivate let modules: [(name: String, img: UIImage?)] = [("能量摄入", UIImage(named: "nengliangsheru")),
                                                    ("能量燃烧", UIImage(named: "nengliangranshao")),
                                                     ("睡眠", UIImage(named: "shuimian")),
                                                    ("心率", UIImage(named: "xinlv")),
                                                    ("血压", UIImage(named: "xueya")),
                                                    ("心理紧张", UIImage(named: "xinlijinzhang")),
                                                    ("饮水量", UIImage(named: "yinshuiliang")),
                                                    ("蓝牙", UIImage(named: "blune"))]

    fileprivate let userView = Bundle.main.loadNibNamed("UserView", owner: nil, options: nil)?.first as! UserView

    fileprivate let locationModules = ["北京", "天津", "河北", "山西", "内蒙古", "辽宁", "吉林", "黑龙江", "上海", "江苏", "浙江", "安徽", "福建", "江西", "山东", "河南", "湖北", "湖南", "广东", "广西", "海南", "重庆", "四川", "贵州", "云南", "西藏", "陕西", "甘肃", "青海", "宁夏", "新疆", "台湾", "香港", "澳门"]


    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.register(UINib(nibName: "RecommendTableViewCell", bundle: nil), forCellReuseIdentifier: "RecommendTableViewCell")

        self.view.addSubview(tableView)


        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: self.view.bounds.width/4, height: 80)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 10)

        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 170), collectionViewLayout: layout)
        //collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        collectionView.register(ModuleCollectionViewCell.self, forCellWithReuseIdentifier: "ModuleCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self


        self.userView.messageBtn.addTarget(self, action: #selector(kk), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(jumpPersonalPageVC(_:)))
        userView.imgView.isUserInteractionEnabled = true
        userView.imgView.addGestureRecognizer(tapGesture)

        userView.locationBtn.addTarget(self, action: #selector(presentPickerView(_:)), for: .touchUpInside)
        userView.locationImgBtn.addTarget(self, action: #selector(presentPickerView(_:)), for: .touchUpInside)



    }
}

extension MainPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section > 1 else {
            return 0
        }

        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return (Bundle.main.loadNibNamed("RecommendTableViewCell", owner: self, options: nil)?.first!) as! UITableViewCell.Type

        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendTableViewCell") as! RecommendTableViewCell
        return cell

    }
}

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print(indexPath)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 170
        } else if section == 1 {
            return 80
        } else {
            return 40
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 3 {
            return 80
        } else {
            return 15
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    @objc func kk() {
        print("fuck")
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section > 1 else {
            if section == 0 {
                return self.collectionView
            }
            return self.userView
        }
        let blankView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        blankView.backgroundColor = .white

        let imgView = UIImageView(frame: CGRect(x: self.view.frame.size.width / 2 - 65 / 2, y: 13, width: 65, height: 14))
        if section == 2 {
            imgView.image = UIImage(named: "zxsp")
        } else {
            imgView.image = UIImage(named: "zbtj")
        }
        blankView.addSubview(imgView)

        let leftLineView = UIView(frame: CGRect(x: imgView.frame.origin.x - 80, y: 18.5, width: 70, height: 3))
        leftLineView.backgroundColor = .black
        let rightLineView = UIView(frame: CGRect(x: imgView.frame.origin.x + 65 + 10, y: 18.5, width: 70, height: 3))
        rightLineView.backgroundColor = .black
        blankView.addSubview(leftLineView)
        blankView.addSubview(rightLineView)

        let bottomLineView = UIView(frame: CGRect(x: 0, y: 39.5, width: self.view.frame.width, height: 0.5))
        bottomLineView.backgroundColor = .lightGray
        blankView.addSubview(bottomLineView)

        return blankView
    }

}

extension MainPageViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.modules.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ModuleCollectionViewCell", for: indexPath) as? ModuleCollectionViewCell else {
            return UICollectionViewCell()
        }

        let data = self.modules[indexPath.item]
        cell.titleLabel.text = data.name
        cell.imageView.image = data.img
        return cell

    }

}

extension MainPageViewController: UICollectionViewDelegate {

}

extension MainPageViewController {

    // 进入个人资料
    @objc func jumpPersonalPageVC(_ sender: UITapGestureRecognizer) {
        let personalPageVC = PersonalPageViewController()
        personalPageVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(personalPageVC, animated: true)
    }

    // 展示 UIPickerView
    @objc func presentPickerView(_ sender: UIButton) {
        if let rootView = UIApplication.shared.keyWindow {

            // Container View
            let emptyView = UIView(frame: rootView.bounds)
            emptyView.backgroundColor = .clear
            let cancelGesture = UITapGestureRecognizer(target: self, action: #selector(cancelPickerView(_:)))
            emptyView.isUserInteractionEnabled = true
            emptyView.addGestureRecognizer(cancelGesture)

            // UIPickerView
            let pickerView = UIPickerView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: 250))
            pickerView.backgroundColor = .lightGray
            pickerView.delegate = self
            pickerView.dataSource = self
            emptyView.addSubview(pickerView)



            // UIToolBar
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: 44))
            let cancelItem = UIBarButtonItem(title: "  取消", style: .done, target: self, action: #selector(toolBarCancelAction(_:)))
            let doneItem = UIBarButtonItem(title: "确定  ", style: .done, target: self, action: #selector(toolBarDoneAction(_:)))
            let flexItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            toolBar.items = [cancelItem, flexItem, doneItem]
            emptyView.addSubview(toolBar)

            UIView.animate(withDuration: 0.25, animations: {
                pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 250, width: UIScreen.main.bounds.size.width, height: 250)
                toolBar.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 250 - 44, width: UIScreen.main.bounds.size.width, height: 44)
            })

            rootView.addSubview(emptyView)
        }
    }

    // 取消 UIPickerView
    @objc func cancelPickerView(_ sender: UITapGestureRecognizer) {
        UIApplication.shared.keyWindow?.subviews.last?.removeFromSuperview()
    }

    @objc func toolBarCancelAction(_ button: UIBarButtonItem) {
        UIApplication.shared.keyWindow?.subviews.last?.removeFromSuperview()
    }

    @objc func toolBarDoneAction(_ button: UIBarButtonItem) {
        guard let emptyView = UIApplication.shared.keyWindow?.subviews.last else {
            return
        }
        guard let pickerView = emptyView.subviews.first as? UIPickerView else {
            return
        }

        let index = pickerView.selectedRow(inComponent: 0)

        self.userView.locationBtn.setTitle(self.locationModules[index], for: .normal)

        UIApplication.shared.keyWindow?.subviews.last?.removeFromSuperview()
    }

}

extension MainPageViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.locationModules[row]
    }

//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }

}

extension MainPageViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.locationModules.count
    }

}
