//
//  Tables.swift
//  
//
//  Created by Steven Obua on 17/12/2021.
//

import Foundation

public class Tables {

public static let primaryMapping : [UInt32 : [UInt32]] = [
    
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
    
public static let symbolMapping : [UInt32 : UInt32] = [
    
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

static let Hebrew : [UInt32] = [
    0x2135, // Alef
    0x2136, // Bet
    0x2137, // Gimel
    0x2138, // Dalet
]
    
static let Digits : [UInt32] = [
    // Digits
    0x0030,
    0x0031,
    0x0032,
    0x0033,
    0x0034,
    0x0035,
    0x0036,
    0x0037,
    0x0038,
    0x0039,
]


}