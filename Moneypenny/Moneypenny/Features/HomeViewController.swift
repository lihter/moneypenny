import UIKit
import Resolver

class HomeViewController: UIViewController {

    var projectListViewController: ProjectListViewController!
    var presenter: HomePresenter!
    var container: Resolver!

    init(presenter: HomePresenter, projectListViewController: ProjectListViewController) {
        super.init(nibName: nil, bundle: nil)

        self.presenter = presenter
        self.projectListViewController = projectListViewController
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

}
