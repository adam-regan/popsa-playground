import UIKit

final class RemindersCoordinator: StackCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vm = RemindersViewModel()
        let vc = RemindersViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }
}
