//
//  MainCoordinator.swift
//  Popsa Playground
//
//  Created by Adam Regan on 18/05/2026.
//

import UIKit

protocol StackCoordinator: Coordinator {
    var navigationController: UINavigationController { get set }
}

protocol MainCoordinatorDelegate: AnyObject {}

final class MainCoordinator: Coordinator {
    private let window: UIWindow
    private let tabBarController: UITabBarController
    weak var coordinatorDelegate: MainCoordinatorDelegate?
    
    var childCoordinators: [MainTab: Coordinator] = [:]
    
    init(window: UIWindow) {
        self.window = window
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        let viewControllers = MainTab.allCases.map { makeNavigationController(for: $0) }
        tabBarController.setViewControllers(viewControllers, animated: false)
        window.rootViewController = tabBarController
    }
    
    private func makeNavigationController(for tab: MainTab) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem(
            title: tab.title,
            image: tab.image,
            selectedImage: tab.selectedImage
        )
        
        let coordinator = makeChildCoordinator(for: tab, navigationController: navController)
        childCoordinators[tab] = coordinator
        coordinator.start()
        
        return navController
    }
    
    private func makeChildCoordinator(
        for tab: MainTab,
        navigationController: UINavigationController
    ) -> StackCoordinator {
        switch tab {
        case .designs:
            return DesignsCoordinator(
                navigationController: navigationController
            )
        case .reminders:
            return RemindersCoordinator(
                navigationController: navigationController
            )
        case .memories:
            return MemoriesCoordinator(
                navigationController: navigationController
            )
        case .basket:
            return BasketCoordinator(
                navigationController: navigationController
            )
        case .account:
            return AccountCoordinator(
                navigationController: navigationController
            )
        }
    }
    
}
