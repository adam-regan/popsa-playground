//
//  AppCoordinator.swift
//  Popsa Playground
//
//  Created by Adam Regan on 16/05/2026.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        if hasInProgressDesign() {
            showMainFlow()
        } else {
            showCreationFlow()
        }
        window.makeKeyAndVisible()
    }

    private func showCreationFlow() {
        let navigationController = UINavigationController()
        let coordinator = CreationCoordinator(navigationController: navigationController)
        coordinator.coordinatorDelegate = self
        childCoordinator = coordinator
        coordinator.start()
        window.rootViewController = navigationController
    }

    private func showMainFlow() {
        let coordinator = MainCoordinator(window: window)
        childCoordinator = coordinator
        coordinator.start()
    }

    private func hasInProgressDesign() -> Bool {
        return false // <----- edit to change entry flow
    }
}

extension AppCoordinator: CreationCoordinatorDelegate {
    func creationDidFinish() {
        showMainFlow()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {}
