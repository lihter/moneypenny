import UIKit

class DynamicCollectionView: UICollectionView {

    override public func layoutSubviews() {
        super.layoutSubviews()

        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }

    override public var intrinsicContentSize: CGSize {
        contentSize
    }

}
