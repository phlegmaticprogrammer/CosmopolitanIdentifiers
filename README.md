# CosmopolitanIdentifiers

Reference implementation for [Cosmopolitan Identifiers](https://doi.org/10.47757/obua.cosmo-id.3) (CIDs) as a Swift package.

The package contains the `CosmoID` type which represents CIDs:

```Swift
import CosmopolitanIdentifiers

let cid = CosmoID(external: "Fréchet Колмого́ров θεώρημα")!
print("CosmoID = \(cid)")
print("Normal form = \(cid.normalizedName)")

let nf = CosmoID("frechet-kolmogorov-theorima")!
assert(cid == nf)
```
