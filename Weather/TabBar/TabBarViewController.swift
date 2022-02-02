//
//  TabBarViewController.swift
//  Weather
//
//  Created by lion on 6.01.22.
//

import UIKit

//class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        delegate = self
//        view.backgroundColor = .systemBackground
//        UITabBar.appearance().barTintColor = .systemBackground
//        tabBar.tintColor = .label
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let firstVC = SettingsViewController()
//        let iconFirstVC = UITabBarItem(title: "settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
//        firstVC.tabBarItem = iconFirstVC
//
//        let secondVC = WeatherDetailsVC()
//        let iconSecondVC = UITabBarItem(title: "weather", image: UIImage(systemName: "thermometer.sun"), selectedImage: UIImage(systemName: "thermometer.sun.fill"))
//        secondVC.tabBarItem = iconSecondVC
//
//        let thirdVC = MapViewController()
//        let iconThirdVC = UITabBarItem(title: "map", image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map.fill"))
//        thirdVC.tabBarItem = iconThirdVC
//
//        let controllers = [firstVC, secondVC, thirdVC]
//        self.viewControllers = controllers
//    }
//
//    //Delegate methods
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        print("Should select viewController: \(viewController.title ?? "") ?")
//        return true;
//    }
//}



final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        updateTabBarAppearance()
    }
    
    private func updateTabBarAppearance() {
        let appearance = UITabBarAppearance()
                    appearance.configureWithOpaqueBackground()
                    appearance.backgroundColor = .white
                    tabBar.standardAppearance =  appearance
                    tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: SettingsViewController(), title: NSLocalizedString("Settings", comment: ""), image: UIImage(systemName: "gearshape")!, selectedImage: UIImage(systemName: "gearshape.fill")!),
            createNavController(for: WeatherDetailsVC(), title: NSLocalizedString("Weather", comment: ""), image: UIImage(systemName: "thermometer.sun")!, selectedImage: UIImage(systemName: "thermometer.sun.fill")!),
            createNavController(for: MapViewController(), title: NSLocalizedString("Map", comment: ""), image: UIImage(systemName: "map")!, selectedImage: UIImage(systemName: "map.fill")!),
            createNavController(for: FavoritsViewController(), title: NSLocalizedString("Favorits", comment: ""), image: UIImage(systemName: "star")!, selectedImage: UIImage(systemName: "star.fill")!)
        ]
    }

    private func createNavController(for rootViewController: UIViewController,
                                     title: String,
                                     image: UIImage,
                                     selectedImage: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        //navController.navigationBar.prefersLargeTitles = true
        //rootViewController.navigationItem.title = title
        return navController
    }
    
    
    
    
   

}
