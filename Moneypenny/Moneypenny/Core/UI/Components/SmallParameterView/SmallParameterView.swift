import UIKit

class SmallParameterView: UIView {

    var titleLabel: Body4Label!
    var valueLabel: Body1BoldLabel!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }

}
