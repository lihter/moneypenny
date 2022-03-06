import UIKit

class SomeViewController: UIViewController {

    var presenter: SomePresenter!

    init(presenter: SomePresenter) {
        super.init(nibName: nil, bundle: nil)

        self.presenter = presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }

}
