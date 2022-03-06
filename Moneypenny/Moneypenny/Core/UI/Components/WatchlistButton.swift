import UIKit

class WatchlistButton: UIButton {

    let size: CGFloat = 32

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension WatchlistButton: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {}

    func styleViews() {
        imageView?.contentMode = .scaleAspectFit
        setBackgroundImage(UIImage(with: .watchlist), for: .normal)
    }

    func defineLayoutForViews() {
        imageView?.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(size / 2)
        }
    }

}
