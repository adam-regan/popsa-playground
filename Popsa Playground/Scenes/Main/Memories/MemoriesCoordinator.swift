import UIKit

final class MemoriesCoordinator: StackCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vm = MemoriesViewModel()
        let vc = MemoriesViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }
}
