import XCTest
@testable import Neos

class PagedAsteroidsSpec: XCTestCase {

    func testPagedAsteroidsCreation() {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource:"testfeed", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()

        let pagedAsteroids = try! decoder.decode(PagedAsteroids.self, from: data)

        XCTAssertEqual(pagedAsteroids.elementCount, 85)
        XCTAssertEqual(pagedAsteroids.asteroids.count, 7)
        XCTAssertEqual(pagedAsteroids.links.selfLink, URL(string: "https://api.nasa.gov/neo/rest/v1/feed?start_date=2017-10-01&end_date=2017-10-07&detailed=false&api_key=\(ApiKey)"))
        XCTAssertEqual(pagedAsteroids.links.previousLink, URL(string: "https://api.nasa.gov/neo/rest/v1/feed?start_date=2017-09-25&end_date=2017-10-01&detailed=false&api_key=\(ApiKey)"))
        XCTAssertEqual(pagedAsteroids.links.nextLink, URL(string: "https://api.nasa.gov/neo/rest/v1/feed?start_date=2017-10-07&end_date=2017-10-13&detailed=false&api_key=\(ApiKey)"))
    }

}

