import XCTest
@testable import EOView

final class EOViewTests: XCTestCase {
    
    private var superview: UIView!
    private var sut: EOView!
    
    override func setUp() {
        self.superview = .init()
        self.sut = .init()
        self.superview.addSubview(self.sut)
    }
    
    override func tearDown() {
        self.sut.removeFromSuperview()
        self.sut = nil
        self.superview = nil
    }
        
    func testMaskToBounds() throws {
        XCTAssertTrue(self.sut.layer.masksToBounds)
    }
    
    func testIsShadowViewAdded() throws {
        XCTAssertTrue(self.sut.isShadowViewAdded)
    }
    
    func testSizesOfViews() throws {
        XCTAssertEqual(self.sut.bounds, self.sut.shadowView.bounds)
    }
    
    func testSuperview() throws {
        XCTAssertEqual(self.sut.superview, self.superview)
    }
    
    func testNumberOfShadowView() throws {
        let referanceCount = self.superview.subviews.filter { subview in
            return subview === self.sut.shadowView
        }.count
        let objectCount = self.superview.subviews.filter { subview in
            return subview == self.sut.shadowView
        }.count
        
        XCTAssertEqual(referanceCount, 1)
        XCTAssertEqual(objectCount, 1)
    }
    
    func testCornerRadius() throws {
        self.sut.cornerRadius = 8
        XCTAssertEqual(self.sut.cornerRadius, 8)
        XCTAssertEqual(self.sut.shadowView.layer.cornerRadius, 8)
        XCTAssertEqual(self.sut.layer.cornerRadius, 8)
    }
    
}
