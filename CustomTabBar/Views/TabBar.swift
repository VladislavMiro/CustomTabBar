//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Vladislav Miroshnichenko on 24.02.2023.
//

import UIKit

@IBDesignable
final class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfigure()
        generateControllers()
    }
    
    private func generateControllers() {
        let first = UIViewController()
        let second = UIViewController()
        
        first.tabBarItem.title = "Home"
        first.tabBarItem.image = UIImage(systemName: "house.fill")
        first.view.backgroundColor = .blue
        second.tabBarItem.title = "Settings"
        second.tabBarItem.image = UIImage(systemName: "gear")
        second.view.backgroundColor = .red
        
        viewControllers = [first, second]
    }
    
    private func tabBarConfigure() {
        let xPos: CGFloat = 10
        let yPos: CGFloat = 10
        let width = tabBar.bounds.width - xPos * 2
        let height = tabBar.bounds.height + yPos * 2
        
        let roundedLayer = CAShapeLayer()
        
        let path = UIBezierPath(
            roundedRect: CGRect(x: xPos,
                                y: tabBar.bounds.minY - yPos,
                                width: width,
                                height: height),
            cornerRadius: height / 2)
        
        roundedLayer.path = path.cgPath
        roundedLayer.fillColor = UIColor.white.cgColor
     
        self.tabBar.layer.insertSublayer(roundedLayer, at: 0)
        self.tabBar.itemWidth = width / 5
        self.tabBar.itemPositioning = .centered
        self.tabBar.tintColor = UIColor.purple
        self.tabBar.unselectedItemTintColor = .black
        
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.backgroundColor = .clear
        self.tabBar.shadowImage = UIImage()
    }
    

}
