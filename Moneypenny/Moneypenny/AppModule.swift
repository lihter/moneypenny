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
        registerPresenters(in: container)
        registerViewControllers(in: container)
    }

    private func registerRouter(in container: Resolver) {
        container
            .register { AppRouter(container: container) }
            .scope(.application)
    }

    private func registerPresenters(in container: Resolver) {
        container
            .register { ProjectListPresenter(router: container.resolve()) }
            .scope(.unique)

        container
            .register { BigProjectListPresenter(router: container.resolve()) }
            .scope(.unique)

        container
            .register { HomePresenter(router: container.resolve()) }
            .scope(.unique)
    }

    private func registerViewControllers(in container: Resolver) {
        container
            .register {
                HomeViewController(
                    presenter: container.resolve(),
                    projectListPresenter: container.resolve(),
                    bigProjectListPresenter: container.resolve())
            }
            .scope(.unique)
    }

}
