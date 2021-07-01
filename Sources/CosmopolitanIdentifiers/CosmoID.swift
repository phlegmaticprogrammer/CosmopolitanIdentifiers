import Foundation

/// Implements Cosmopolitan Identifiers as defined in https://doi.org/10.47757/obua.cosmo-id.3
public struct CosmoID : CustomStringConvertible, Hashable {
    
    public let name : String
    public let normalizedName : String
    
    public init?(_ name : String) {
        let parts = CosmoID.splitIntoParts(name)
        guard parts.count > 0 else { return nil }
        var normalizedParts : [String] = []
        var leading = true
        for part in parts {
            guard let p = CosmoID.normalizePart(part, leading: leading) else { return nil }
            leading = false
            normalizedParts.append(p)
        }
        self.name = parts.joined(separator: "-")
        self.normalizedName = normalizedParts.joined(separator: "-")
    }
    
    public init?(external name: String) {
        self.init(CosmoID.cleanup(name))
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(normalizedName)
    }
    
    public static func ==(lhs : CosmoID, rhs : CosmoID) -> Bool {
        return lhs.normalizedName == rhs.normalizedName
    }
    
    public var description: String {
        return name
    }
    
    private static func splitIntoParts(_ name : String) -> [String] {
        var parts : [String] = []
        var current = ""
        var currentIsDigits = false
        for c in name {
            if c == "-" {
                parts.append(current)
                current = ""
                currentIsDigits = false
            } else if c >= "0" && c <= "9" {
                if currentIsDigits {
                    current.append(c)
                } else {
                    if !current.isEmpty {
                        parts.append(current)
                    }
                    currentIsDigits = true
                    current = String(c)
                }
            } else {
                if currentIsDigits {
                    parts.append(current)
                    currentIsDigits = false
                    current = String(c)
                } else {
                    current.append(c)
                }
            }
        }
        parts.append(current)
        return parts
    }
        
    private static func cleanup(_ name : String) -> String {
        var result = ""
        var spaces = 0
        for c in name.trimmingCharacters(in: [" "]) {
            if c == " " {
                spaces += 1
            } else {
                if spaces > 0 {
                    spaces = 0
                    result.append("-")
                }
                if c == "_" {
                    result.append("-")
                } else {
                    result.append(c)
                }
            }
        }
        return result
    }
        
    private typealias Char = (code: UInt32, marks: Set<UInt32>)
        
    private static func makeChars(_ name : String) -> [Char]? {
        var result : [Char] = []
        let name = name.decomposedStringWithCanonicalMapping
        for c in name {
            let scalars = c.unicodeScalars
            guard let value = scalars.first?.value else {
                return nil
            }
            var marks : Set<UInt32> = []
            for s in scalars.dropFirst() {
                let v = s.value
                guard allowedMarks.contains(v) else { return nil }
                marks.insert(v)
            }
            result.append((code: value, marks: marks))
        }
        if result.isEmpty { return nil } else { return result }
    }
    
    private static func normalizePart(_ name : String, leading: Bool) -> String? {
        guard let chars = makeChars(name) else { return nil }
        if let symbolID = normalizeSymbol(chars) {
            return symbolID
        } else {
            return normalizeWord(chars, leading: leading)
        }
    }
    
    private static func normalizeSymbol(_ chars : [Char]) -> String? {
        guard chars.count == 1 else { return nil }
        guard let first = chars.first, first.marks.isEmpty else { return nil }
        guard let symbol = symbolMapping[first.code] else {
            if mathSymbols.contains(first.code) {
                return String(UnicodeScalar(first.code)!)
            } else {
                return nil
            }
        }
        return String(UnicodeScalar(symbol)!)
    }
    
    private static func isSymbol(_ name : [UInt32]) -> Bool {
        let chars = name.map { code in Char(code: code, marks: []) }
        return normalizeSymbol(chars) != nil
    }
    
    private static func normalizeWord(_ chars : [Char], leading: Bool) -> String? {
        var result : [UInt32] = []
        var i = 0
        let count = chars.count
        while i < count {
            let code = chars[i].code
            if let (mark, replacement) = Cyrillic_special[code],
               chars[i].marks.contains(mark)
            {
                result.append(contentsOf: replacement)
                i += 1
                continue
            }
            if i+1 < count,
               let gs = Greek_special[[code, chars[i+1].code]]
            {
                result.append(contentsOf: gs)
                i += 2
                continue
            }
            guard let mapped = primaryMapping[code] else {
                return nil
            }
            result.append(contentsOf: mapped)
            i += 1
        }
        guard let first = result.first else { return nil }
        guard !leading || (first >= 0x61 && first <= 0x7A) else { return nil }
        if isSymbol(result) { return nil }
        return String(result.map { v in Character(UnicodeScalar(v)!)})
    }
    
    private static let mathSymbols : Set<UInt32> = Set(UnicodeMathSymbols.all)
    
    private static let allowedMarks : Set<UInt32> = [
        0x0300,
        0x0301,
        0x0302,
        0x0303,
        0x0304,
        0x0305,
        0x0306,
        0x0307,
        0x0308,
        0x0309,
        0x030A,
        0x030B,
        0x030C,
        0x030F,
        0x0311,
        0x0313,
        0x0314,
        0x031B,
        0x0323,
        0x0324,
        0x0325,
        0x0326,
        0x0327,
        0x0328,
        0x032D,
        0x032E,
        0x0330,
        0x0331,
        0x0342,
        0x0345
    ]
    
    private static let symbolMapping : [UInt32 : UInt32] = [
        
        // Latin Uppercase Symbols
        0x0041 : 0x0041,
        0x0042 : 0x0042,
        0x0043 : 0x0043,
        0x0044 : 0x0044,
        0x0045 : 0x0045,
        0x0046 : 0x0046,
        0x0047 : 0x0047,
        0x0048 : 0x0048,
        0x0049 : 0x0049,
        0x004A : 0x004A,
        0x004B : 0x004B,
        0x004C : 0x004C,
        0x004D : 0x004D,
        0x004E : 0x004E,
        0x004F : 0x004F,
        0x0050 : 0x0050,
        0x0051 : 0x0051,
        0x0052 : 0x0052,
        0x0053 : 0x0053,
        0x0054 : 0x0054,
        0x0055 : 0x0055,
        0x0056 : 0x0056,
        0x0057 : 0x0057,
        0x0058 : 0x0058,
        0x0059 : 0x0059,
        0x005A : 0x005A,

        // Latin Lowercase Symbols
        0x0061 : 0x0061,
        0x0062 : 0x0062,
        0x0063 : 0x0063,
        0x0064 : 0x0064,
        0x0065 : 0x0065,
        0x0066 : 0x0066,
        0x0067 : 0x0067,
        0x0068 : 0x0068,
        0x0069 : 0x0069,
        0x006A : 0x006A,
        0x006B : 0x006B,
        0x006C : 0x006C,
        0x006D : 0x006D,
        0x006E : 0x006E,
        0x006F : 0x006F,
        0x0070 : 0x0070,
        0x0071 : 0x0071,
        0x0072 : 0x0072,
        0x0073 : 0x0073,
        0x0074 : 0x0074,
        0x0075 : 0x0075,
        0x0076 : 0x0076,
        0x0077 : 0x0077,
        0x0078 : 0x0078,
        0x0079 : 0x0079,
        0x007A : 0x007A,
        
        // Greek Uppercase Symbols
        0x0391 : 0x0041,
        0x0392 : 0x0042,
        0x0393 : 0x0393,
        0x0394 : 0x0394,
        0x0395 : 0x0045,
        0x0396 : 0x005A,
        0x0397 : 0x0048,
        0x0398 : 0x0398,
        0x0399 : 0x0049,
        0x039A : 0x004B,
        0x039B : 0x039B,
        0x039C : 0x004D,
        0x039D : 0x004E,
        0x039E : 0x039E,
        0x039F : 0x004F,
        0x03A0 : 0x03A0,
        0x03A1 : 0x0050,
        0x03A3 : 0x03A3,
        0x03A4 : 0x0054,
        0x03A5 : 0x0059,
        0x03A6 : 0x03A6,
        0x03A7 : 0x0058,
        0x03A8 : 0x03A8,
        0x03A9 : 0x03A9,
        
        // Greek Lowercase Symbols
        0x03B1 : 0x03B1,
        0x03B2 : 0x03B2,
        0x03B3 : 0x03B3,
        0x03B4 : 0x03B4,
        0x03B5 : 0x03B5,
        0x03B6 : 0x03B6,
        0x03B7 : 0x03B7,
        0x03B8 : 0x03B8,
        0x03B9 : 0x03B9,
        0x03BA : 0x03BA,
        0x03BB : 0x03BB,
        0x03BC : 0x03BC,
        0x03BD : 0x03BD,
        0x03BE : 0x03BE,
        0x03BF : 0x03BF,
        0x03C0 : 0x03C0,
        0x03C1 : 0x03C1,
        0x03C2 : 0x03C2,
        0x03C3 : 0x03C3,
        0x03C4 : 0x03C4,
        0x03C5 : 0x03C5,
        0x03C6 : 0x03C6,
        0x03C7 : 0x03C7,
        0x03C8 : 0x03C8,
        0x03C9 : 0x03C9,
        
        // Cyrillic Symbols
        0x0404 : 0x0404,
        0x0405 : 0x0053,
        0x0406 : 0x0049,
        0x0408 : 0x004A,
        0x0409 : 0x0409,
        0x040A : 0x040A,
        0x040F : 0x040F,
        0x0410 : 0x0041,
        0x0411 : 0x0411,
        0x0412 : 0x0042,
        0x0413 : 0x0393,
        0x0414 : 0x0414,
        0x0415 : 0x0045,
        0x0416 : 0x0416,
        0x0417 : 0x0417,
        0x0418 : 0x0418,
        0x041A : 0x004B,
        0x041B : 0x041B,
        0x041C : 0x004D,
        0x041D : 0x0048,
        0x041E : 0x004F,
        0x041F : 0x03A0,
        0x0420 : 0x0050,
        0x0421 : 0x0043,
        0x0422 : 0x0054,
        0x0423 : 0x0079,
        0x0424 : 0x0424,
        0x0425 : 0x0058,
        0x0426 : 0x0426,
        0x0427 : 0x0427,
        0x0428 : 0x0428,
        0x042D : 0x042D,
        0x042E : 0x042E,
        0x042F : 0x042F,
        0x0430 : 0x0061,
        0x0431 : 0x0431,
        0x0432 : 0x0042,
        0x0433 : 0x0393,
        0x0434 : 0x0414,
        0x0435 : 0x0065,
        0x0436 : 0x0416,
        0x0437 : 0x0417,
        0x0438 : 0x0418,
        0x043A : 0x004B,
        0x043B : 0x041B,
        0x043C : 0x004D,
        0x043D : 0x0048,
        0x043E : 0x006F,
        0x043F : 0x03A0,
        0x0440 : 0x0070,
        0x0441 : 0x0063,
        0x0442 : 0x0054,
        0x0443 : 0x0079,
        0x0444 : 0x0424,
        0x0445 : 0x0078,
        0x0446 : 0x0426,
        0x0447 : 0x0427,
        0x0448 : 0x0428,
        0x044D : 0x042D,
        0x044E : 0x042E,
        0x044F : 0x042F,
        0x0454 : 0x0404,
        0x0455 : 0x0073,
        0x0456 : 0x0069,
        0x0458 : 0x006A,
        0x0459 : 0x0409,
        0x045A : 0x040A,
        0x045F : 0x040F
    ]
    
    private static let primaryMapping : [UInt32 : [UInt32]] = [
        
        // Digits
        0x0030 : [0x0030],
        0x0031 : [0x0031],
        0x0032 : [0x0032],
        0x0033 : [0x0033],
        0x0034 : [0x0034],
        0x0035 : [0x0035],
        0x0036 : [0x0036],
        0x0037 : [0x0037],
        0x0038 : [0x0038],
        0x0039 : [0x0039],

        // Latin Lowercase Primaries
        0x0061 : [0x0061],
        0x0062 : [0x0062],
        0x0063 : [0x0063],
        0x0064 : [0x0064],
        0x0065 : [0x0065],
        0x0066 : [0x0066],
        0x0067 : [0x0067],
        0x0068 : [0x0068],
        0x0069 : [0x0069],
        0x006A : [0x006A],
        0x006B : [0x006B],
        0x006C : [0x006C],
        0x006D : [0x006D],
        0x006E : [0x006E],
        0x006F : [0x006F],
        0x0070 : [0x0070],
        0x0071 : [0x0071],
        0x0072 : [0x0072],
        0x0073 : [0x0073],
        0x0074 : [0x0074],
        0x0075 : [0x0075],
        0x0076 : [0x0076],
        0x0077 : [0x0077],
        0x0078 : [0x0078],
        0x0079 : [0x0079],
        0x007A : [0x007A],
        
        // Latin Uppercase Primaries
        0x0041 : [0x0061],
        0x0042 : [0x0062],
        0x0043 : [0x0063],
        0x0044 : [0x0064],
        0x0045 : [0x0065],
        0x0046 : [0x0066],
        0x0047 : [0x0067],
        0x0048 : [0x0068],
        0x0049 : [0x0069],
        0x004A : [0x006A],
        0x004B : [0x006B],
        0x004C : [0x006C],
        0x004D : [0x006D],
        0x004E : [0x006E],
        0x004F : [0x006F],
        0x0050 : [0x0070],
        0x0051 : [0x0071],
        0x0052 : [0x0072],
        0x0053 : [0x0073],
        0x0054 : [0x0074],
        0x0055 : [0x0075],
        0x0056 : [0x0076],
        0x0057 : [0x0077],
        0x0058 : [0x0078],
        0x0059 : [0x0079],
        0x005A : [0x007A],
        
        // Additional Latin Primaries
        0x00C6 : [0x0061, 0x0065],
        0x00D8 : [0x006F],
        0x00DF : [0x0073, 0x0073],
        0x00E6 : [0x0061, 0x0065],
        0x00F8 : [0x006F],
        0x0110 : [0x0064],
        0x0111 : [0x0064],
        0x0141 : [0x006C],
        0x0142 : [0x006C],
        0x0152 : [0x006F, 0x0065],
        0x0153 : [0x006F, 0x0065],
        0x01C4 : [0x0064, 0x007A],
        0x01C5 : [0x0064, 0x007A],
        0x01C6 : [0x0064, 0x007A],
        0x01C8 : [0x006C, 0x006A],
        0x01CB : [0x006E, 0x006A],
        0x01F1 : [0x0064, 0x007A],
        0x01F2 : [0x0064, 0x007A],
        0x01F3 : [0x0064, 0x007A],
        0x1E9E : [0x0073, 0x0073],
        0xFB00 : [0x0066, 0x0066],
        0xFB01 : [0x0066, 0x0069],
        0xFB02 : [0x0066, 0x006C],
        0xFB03 : [0x0066, 0x0066, 0x0069],
        0xFB04 : [0x0066, 0x0066, 0x006C],
        0xFB06 : [0x0073, 0x0074],
        
        // Greek Uppercase Primaries
        0x0391 : [0x0061],
        0x0392 : [0x0076],
        0x0393 : [0x0067],
        0x0394 : [0x0064],
        0x0395 : [0x0065],
        0x0396 : [0x007A],
        0x0397 : [0x0069],
        0x0398 : [0x0074, 0x0068],
        0x0399 : [0x0069],
        0x039A : [0x006B],
        0x039B : [0x006C],
        0x039C : [0x006D],
        0x039D : [0x006E],
        0x039E : [0x0078],
        0x039F : [0x006F],
        0x03A0 : [0x0070],
        0x03A1 : [0x0072],
        0x03A3 : [0x0073],
        0x03A4 : [0x0074],
        0x03A5 : [0x0079],
        0x03A6 : [0x0066],
        0x03A7 : [0x0063, 0x0068],
        0x03A8 : [0x0070, 0x0073],
        0x03A9 : [0x006F],
        
        // Greek Lowercase Primaries
        0x03B1 : [0x0061],
        0x03B2 : [0x0076],
        0x03B3 : [0x0067],
        0x03B4 : [0x0064],
        0x03B5 : [0x0065],
        0x03B6 : [0x007A],
        0x03B7 : [0x0069],
        0x03B8 : [0x0074, 0x0068],
        0x03B9 : [0x0069],
        0x03BA : [0x006B],
        0x03BB : [0x006C],
        0x03BC : [0x006D],
        0x03BD : [0x006E],
        0x03BE : [0x0078],
        0x03BF : [0x006F],
        0x03C0 : [0x0070],
        0x03C1 : [0x0072],
        0x03C2 : [0x0073],
        0x03C3 : [0x0073],
        0x03C4 : [0x0074],
        0x03C5 : [0x0079],
        0x03C6 : [0x0066],
        0x03C7 : [0x0063, 0x0068],
        0x03C8 : [0x0070, 0x0073],
        0x03C9 : [0x006F],
        
        // Cyrillic Primaries
        0x0404 : [0x0059, 0x0065],
        0x0405 : [0x007A],
        0x0406 : [0x0069],
        0x0408 : [0x006A],
        0x0409 : [0x006C],
        0x040A : [0x006E],
        0x040F : [0x0064, 0x0068],
        0x0410 : [0x0061],
        0x0411 : [0x0062],
        0x0412 : [0x0076],
        0x0413 : [0x0067],
        0x0414 : [0x0064],
        0x0415 : [0x0065],
        0x0416 : [0x007A, 0x0068],
        0x0417 : [0x007A],
        0x0418 : [0x0069],
        0x041A : [0x006B],
        0x041B : [0x006C],
        0x041C : [0x006D],
        0x041D : [0x006E],
        0x041E : [0x006F],
        0x041F : [0x0070],
        0x0420 : [0x0072],
        0x0421 : [0x0073],
        0x0422 : [0x0074],
        0x0423 : [0x0075],
        0x0424 : [0x0066],
        0x0425 : [0x0078],
        0x0426 : [0x0063, 0x007A],
        0x0427 : [0x0063, 0x0068],
        0x0428 : [0x0073, 0x0068],
        0x0429 : [0x0073, 0x0068, 0x0068],
        0x042A : [],
        0x042B : [0x0079],
        0x042C : [],
        0x042D : [0x0065],
        0x042E : [0x0079, 0x0075],
        0x042F : [0x0079, 0x0061],
        0x0430 : [0x0061],
        0x0431 : [0x0062],
        0x0432 : [0x0076],
        0x0433 : [0x0067],
        0x0434 : [0x0064],
        0x0435 : [0x0065],
        0x0436 : [0x007A, 0x0068],
        0x0437 : [0x007A],
        0x0438 : [0x0069],
        0x043A : [0x006B],
        0x043B : [0x006C],
        0x043C : [0x006D],
        0x043D : [0x006E],
        0x043E : [0x006F],
        0x043F : [0x0070],
        0x0440 : [0x0072],
        0x0441 : [0x0073],
        0x0442 : [0x0074],
        0x0443 : [0x0075],
        0x0444 : [0x0066],
        0x0445 : [0x0078],
        0x0446 : [0x0063, 0x007A],
        0x0447 : [0x0063, 0x0068],
        0x0448 : [0x0073, 0x0068],
        0x0449 : [0x0073, 0x0068, 0x0068],
        0x044A : [],
        0x044B : [0x0079],
        0x044C : [],
        0x044D : [0x0065],
        0x044E : [0x0079, 0x0075],
        0x044F : [0x0079, 0x0061],
        0x0454 : [0x0059, 0x0065],
        0x0455 : [0x007A],
        0x0456 : [0x0069],
        0x0458 : [0x006A],
        0x0459 : [0x006C],
        0x045A : [0x006E],
        0x045F : [0x0064, 0x0068],
        0x0490 : [0x0067],
        0x0491 : [0x0067]
    ]

    private static let Greek_special : [[UInt32] : [UInt32]] = [
        // mappings to "au"
        [0x0391, 0x03A5] : [0x0061, 0x0075],
        [0x0391, 0x03C5] : [0x0061, 0x0075],
        [0x03B1, 0x03A5] : [0x0061, 0x0075],
        [0x03B1, 0x03C5] : [0x0061, 0x0075],

        // mappings to "eu"
        [0x0395, 0x03A5] : [0x0065, 0x0075],
        [0x0395, 0x03C5] : [0x0065, 0x0075],
        [0x03B5, 0x03A5] : [0x0065, 0x0075],
        [0x03B5, 0x03C5] : [0x0065, 0x0075],

        // mappings to "ou"
        [0x039F, 0x03A5] : [0x006F, 0x0075],
        [0x039F, 0x03C5] : [0x006F, 0x0075],
        [0x03BF, 0x03A5] : [0x006F, 0x0075],
        [0x03BF, 0x03C5] : [0x006F, 0x0075]
    ]
    
    private static let Cyrillic_special : [UInt32 : (UInt32, [UInt32])] = [
        // mapping to "j"
        0x0418 : (0x0306, [0x006A]),
        0x0438 : (0x0306, [0x006A]),
        
        // mapping to "yi"
        0x0406 : (0x0308, [0x0079, 0x0069]),
        0x0456 : (0x0308, [0x0079, 0x0069]),

        // mapping to "yo"
        0x0415 : (0x0308, [0x0079, 0x006F]),
        0x0435 : (0x0308, [0x0079, 0x006F]),
    ]
    
}
