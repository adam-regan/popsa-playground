//
//  CreationCoordinator.swift
//  Popsa Playground
//
//  Created by Adam Regan on 16/05/2026.
//

import UIKit

protocol CreationCoordinatorDelegate: AnyObject {
    func creationDidFinish()
}

final class CreationCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController
    weak var coordinatorDelegate: CreationCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showCreationView()
    }

    func creationDidFinish() {
        coordinatorDelegate?.creationDidFinish()
    }

    private func showCreationView() {
        let vm = CreationViewModel()
        vm.coordinator = self
        let vc = CreationViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }

    private func showCreateOrnament() {
        let vm = CreateOrnamentViewModel()
        vm.coordinator = self
        let vc = CreateOrnamentViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CreationCoordinator: CreationViewModelDelegate {
    func viewModelCreateOrnamentDidTap() {
        showCreateOrnament()
    }
}

extension CreationCoordinator: CreateOrnamentViewModelDelegate {
    func viewModelItemCreated() {
        coordinatorDelegate?.creationDidFinish()
    }
}
