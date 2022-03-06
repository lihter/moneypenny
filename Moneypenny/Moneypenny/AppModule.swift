import UIKit
import Resolver

class AppModule {

    init(container: Resolver) {
        registerAllServices(in: container)
    }

    func start(in window: UIWindow?, container: Resolver) {
        let router: AppRouter = container.resolve()
        router.start(in: window)
    }

}

extension AppModule {

    func registerAllServices(in container: Resolver) {
        registerRouter(in: container)
        registerFirstScreen(in: container)
    }

    private func registerRouter(in container: Resolver) {
        container
            .register { AppRouter(container: container) }
            .scope(.application)
    }

    private func registerFirstScreen(in container: Resolver) {
        container
            .register { SomePresenter(router: container.resolve()) }
            .scope(.unique)

        container
            .register { SomeViewController(presenter: container.resolve()) }
            .scope(.unique)
    }

}
