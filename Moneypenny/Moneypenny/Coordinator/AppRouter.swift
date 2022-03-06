import UIKit
import Resolver

final class AppRouter {

    let container: Resolver!

    private let navigationController: UINavigationController!

    init(container: Resolver) {
        self.container = container

        navigationController = UINavigationController()
    }

    func start(in window: UIWindow?) {
        let viewController: HomeViewController = container.resolve()

        navigationController.setViewControllers([viewController], animated: true)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
