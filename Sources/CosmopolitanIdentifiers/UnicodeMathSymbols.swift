import Foundation

import Foundation

struct UnicodeMathSymbols {
    
    static let scriptCapital : [UInt32] = [
        0x1D49C,
        0x212C,
        0x1D49E,
        0x1D49F,
        0x2130,
        0x2131,
        0x1D4A2,
        0x210B,
        0x2110,
        0x1D4A5,
        0x1D4A6,
        0x2112,
        0x2133,
        0x1D4A9,
        0x1D4AA,
        0x1D4AB,
        0x1D4AC,
        0x211B,
        0x1D4AE,
        0x1D4AF,
        0x1D4B0,
        0x1D4B1,
        0x1D4B2,
        0x1D4B3,
        0x1D4B4,
        0x1D4B5
    ]
    
    static let scriptSmall : [UInt32] = [
        0x1D4B6,
        0x1D4B7,
        0x1D4B8,
        0x1D4B9,
        0x212F,
        0x1D4BB,
        0x210A,
        0x1D4BD,
        0x1D4BE,
        0x1D4BF,
        0x1D4C0,
        0x1D4C1,
        0x1D4C2,
        0x1D4C3,
        0x2134,
        0x1D4C5,
        0x1D4C6,
        0x1D4C7,
        0x1D4C8,
        0x1D4C9,
        0x1D4CA,
        0x1D4CB,
        0x1D4CC,
        0x1D4CD,
        0x1D4CE,
        0x1D4CF
    ]
    
    static let frakturCapital : [UInt32] = [
        0x1D504,
        0x1D505,
        0x212D,
        0x1D507,
        0x1D508,
        0x1D509,
        0x1D50A,
        0x210C,
        0x2111,
        0x1D50D,
        0x1D50E,
        0x1D50F,
        0x1D510,
        0x1D511,
        0x1D512,
        0x1D513,
        0x1D514,
        0x211C,
        0x1D516,
        0x1D517,
        0x1D518,
        0x1D519,
        0x1D51A,
        0x1D51B,
        0x1D51C,
        0x2128
    ]
    
    static let frakturSmall : [UInt32] = [
        0x1D51E,
        0x1D51F,
        0x1D520,
        0x1D521,
        0x1D522,
        0x1D523,
        0x1D524,
        0x1D525,
        0x1D526,
        0x1D527,
        0x1D528,
        0x1D529,
        0x1D52A,
        0x1D52B,
        0x1D52C,
        0x1D52D,
        0x1D52E,
        0x1D52F,
        0x1D530,
        0x1D531,
        0x1D532,
        0x1D533,
        0x1D534,
        0x1D535,
        0x1D536,
        0x1D537
    ]

    static let doubleStruckCapital : [UInt32] = [
        0x1D538,
        0x1D539,
        0x2102,
        0x1D53B,
        0x1D53C,
        0x1D53D,
        0x1D53E,
        0x210D,
        0x1D540,
        0x1D541,
        0x1D542,
        0x1D543,
        0x1D544,
        0x2115,
        0x1D546,
        0x2119,
        0x211A,
        0x211D,
        0x1D54A,
        0x1D54B,
        0x1D54C,
        0x1D54D,
        0x1D54E,
        0x1D54F,
        0x1D550,
        0x2124
    ]
    
    static let doubleStruckSmall : [UInt32] = [
        0x1D552,
        0x1D553,
        0x1D554,
        0x1D555,
        0x1D556,
        0x1D557,
        0x1D558,
        0x1D559,
        0x1D55A,
        0x1D55B,
        0x1D55C,
        0x1D55D,
        0x1D55E,
        0x1D55F,
        0x1D560,
        0x1D561,
        0x1D562,
        0x1D563,
        0x1D564,
        0x1D565,
        0x1D566,
        0x1D567,
        0x1D568,
        0x1D569,
        0x1D56A,
        0x1D56B
    ]
    
    static let doubleStruckDigits : [UInt32] = [
        0x1D7D8,
        0x1D7D9,
        0x1D7DA,
        0x1D7DB,
        0x1D7DC,
        0x1D7DD,
        0x1D7DE,
        0x1D7DF,
        0x1D7E0,
        0x1D7E1
    ]
    
    static let doubleStruckOther : [UInt32] = [
        0x213C, 0x213D, 0x213E, 0x213F, 0x2140
    ]
    
    static let other : [UInt32] = [
        0x2135, // Alef
        0x2136, // Bet
        0x2137, // Gimel
        0x2138, // Dalet
    ]
    
    static let all = other +
        scriptCapital + scriptSmall +
        frakturCapital + frakturSmall +
        doubleStruckCapital + doubleStruckSmall + doubleStruckDigits + doubleStruckOther
    
}
