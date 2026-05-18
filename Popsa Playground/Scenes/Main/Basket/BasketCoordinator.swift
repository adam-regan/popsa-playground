import UIKit

final class BasketCoordinator: StackCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vm = BasketViewModel()
        let vc = BasketViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }
}
