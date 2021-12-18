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
        
        func hex(_ x : UInt32) -> String {
            return String(format:"0x%04X", x)
        }
        
        func printPrimaries(_ descr : String, _ from : UInt32, _ to : UInt32)
        {
            let primaries = Tables.primaryMapping
            let d = descr.uppercased().replacingOccurrences(of: " ", with: "_")
            print("\(d) : new Map([")
            var keys : [UInt32] = []
            for k in primaries.keys {
                if k >= from && k <= to {
                    keys.append(k)
                }
            }
            keys.sort()
            var lines : [String] = []
            for k in keys {
                let values = primaries[k]!
                lines.append("[\(hex(k)), [\(values.map(hex).joined(separator: ", "))]]")
            }
            print("    " + lines.joined(separator: ",\n    "))
            print("]),")
            print("")
        }
        
        func printSymbols(_ descr : String, _ from : UInt32, _ to : UInt32, _ symbols : [UInt32 : UInt32] = Tables.symbolMapping)
        {
            let d = descr.uppercased().replacingOccurrences(of: " ", with: "_")
            print("\(d) : new Map([")
            var keys : [UInt32] = []
            for k in symbols.keys {
                if k >= from && k <= to {
                    keys.append(k)
                }
            }
            keys.sort()
            var lines : [String] = []
            for k in keys {
                let value = symbols[k]!
                lines.append("[\(hex(k)), \(hex(value))]")
            }
            print("    " + lines.joined(separator: ",\n    "))
            print("]),")
            print("")

        }
        
        func printSymbols(_ descr : String, _ symbols : [UInt32]) {
            var mapping : [UInt32 : UInt32] = [:]
            for s in symbols {
                mapping[s] = s
            }
            printSymbols(descr, UInt32.min, UInt32.max, mapping)
        }
        
        func testPrintLettersTypeScript() {
            printPrimaries("Latin Lowercase", 0x0061, 0x007A);
            printPrimaries("Latin Uppercase", 0x0041, 0x005A);
            printPrimaries("Latin Additional 1", 0x00C6, 0x01F3);
            printPrimaries("Latin Additional 2", 0x1E9E, 0xFB06);
            printPrimaries("Greek Uppercase", 0x0391, 0x03A9);
            printPrimaries("Greek Lowercase", 0x03B1, 0x03C9);
            printPrimaries("Cyrillic", 0x0404, 0x0491);
        }
        
        func testPrintSymbolsTypeScript() {
            printSymbols("Digits", Tables.Digits)
            printSymbols("Latin Lowercase", 0x0061, 0x007A);
            printSymbols("Latin Uppercase", 0x0041, 0x005A);
            printSymbols("Greek Uppercase", 0x0391, 0x03A9);
            printSymbols("Greek Lowercase", 0x03B1, 0x03C9);
            printSymbols("Cyrillic", 0x0404, 0x0491);
            printSymbols("Script Uppercase", Tables.scriptCapital)
            printSymbols("Script Lowercase", Tables.scriptSmall)
            printSymbols("Fraktur Uppercase", Tables.frakturCapital)
            printSymbols("Fraktur Lowercase", Tables.frakturSmall)
            printSymbols("Double Struck Uppercase", Tables.doubleStruckCapital)
            printSymbols("Double Struck Lowercase", Tables.doubleStruckSmall)
            printSymbols("Double Struck Digits", Tables.doubleStruckDigits)
            printSymbols("Double Struck Greek", Tables.doubleStruckOther)
            printSymbols("Hebrew", Tables.Hebrew)
        }
        
        

    }
