import UIKit

final class DesignsCoordinator: StackCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vm = DesignsViewModel()
        let vc = DesignsViewController(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }
}
