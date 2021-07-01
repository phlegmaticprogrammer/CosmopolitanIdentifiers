    import XCTest
    import CosmopolitanIdentifiers

    final class CosmopolitanIdentifiersTests: XCTestCase {
        
        func noID(_ name : String) {
            XCTAssertNil(CosmoID(name))
        }
        
        func testID(_ name : String, normalized : String) {
            let id = CosmoID(external: name)
            XCTAssertEqual(id?.normalizedName, normalized)
        }
                
        func testCosmoID() {
            noID("10")
            testID("a", normalized: "a")
            testID(" a", normalized: "a")
            testID("A", normalized: "A")
            testID(" A ", normalized: "A")
            noID(" Ä ")
            noID("Ä")
            testID("Ärger", normalized: "arger")
            testID("lothar-matthaus-10", normalized: "lothar-matthaus-10")
            testID("lothar  matthaus 10", normalized: "lothar-matthaus-10")
            testID("Lothar-Matthaus-10", normalized: "lothar-matthaus-10")
            testID("lothar-matthäus", normalized: "lothar-matthaus")
            noID("10")
            noID("10-lothar-matthaus")
            noID("lothar-matthaus-")
            noID("lothar--matthaus")
            noID("lothar - matthaus")
            noID("-lothar")
            noID("lothar-")
            noID("x-")
            testID("Μπέχρος", normalized: "mpechros")
            testID("Γ", normalized: "Γ")
            testID("γ", normalized: "γ")
            testID("Γ1", normalized: "Γ-1")
            testID("γ1", normalized: "γ-1")
            testID("Γ-1", normalized: "Γ-1")
            testID("γ-1", normalized: "γ-1")
            testID("Γγ", normalized: "gg")
            testID("Γ1γ", normalized: "Γ-1-γ")
            testID("Γ1-γ", normalized: "Γ-1-γ")
            testID("Γ1-1γ", normalized: "Γ-1-1-γ")
            testID("Андре́й Никола́евич Колмого́ров", normalized: "andrej-nikolaevich-kolmogorov")
            testID("Φορτραν", normalized: "fortran")
            testID("Åb", normalized: "ab")
            noID("Å")
            testID("𝔸", normalized: "𝔸")
            testID("ℂ", normalized: "ℂ")
            testID("ℂ1", normalized: "ℂ-1")
            noID("ℂℂ")
            testID("ℂ-ℂ", normalized: "ℂ-ℂ")
            testID("ℂ_ℂ", normalized: "ℂ-ℂ")
            testID("ℂ1", normalized: "ℂ-1")
            noID("℃")
            noID("ℎ")
            noID("ℏ")
        }
        
        func testExample() {
            let cid = CosmoID(external: "Fréchet Колмого́ров θεώρημα")!
            print("CosmoID = \(cid)")
            print("Normal form = \(cid.normalizedName)")

            let nf = CosmoID("frechet-kolmogorov-theorima")!
            XCTAssertEqual(cid, nf)
        }

    }
