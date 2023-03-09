# OK, but what's the catch?

---

## You can't write C in Rust

* You have to think about memory up-front
  * Who owns any given value?
  * Who needs to borrow it and when?
  * Does it live long enough to satisfy those borrows?
  * Are you borrowing something that might move?

---

## Rust exposes underlying complexity

* Rust strings are always valid UTF-8, and not null-terminated
* C strings are null-terminated, and of unspecified encoding
* OS strings are 8-bit on some platforms and 16-bit on others (Windows)
* Paths on disk are not always valid Unicode
* You get: `String`/`&str`, `CString`/`CStr`, `OsString`/`OsStr`, `PathBuf`/`Path`

---

## Rust doesn't interact well with C++ code

* Rust doesn't understand classes or templates
* Neither Rust nor C++ have a stable ABI
* Projects do exist to auto-generate bindings, like [cxx](https://crates.io/crates/cxx)

---

## Touching the hardware requires `unsafe`

* Hardware is a blob of shared-mutable state and you have to manually verify
    your access to it is correct

---

##  What you have works just fine

* If it's safe enough, maintainable enough and fast enough, then you should keep it!

---

## It's early days for building critical-systems in Rust

* Ferrocene is good, but C and Ada have a multi-decade head start

