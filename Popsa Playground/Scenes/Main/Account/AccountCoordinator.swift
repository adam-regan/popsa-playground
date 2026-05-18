import UIKit

final class AccountCoordinator: StackCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vm = AccountViewModel()
        let vc = AccountViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }
}
