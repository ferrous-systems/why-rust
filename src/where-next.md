# Where Next?

<style>
.columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
}
</style>

## Performance, Safety, Productivity

## 1) Is Rust fast?

## A Comparison

Let's use Python to calculate the sum of the cubes of the first 100 million integers.

```python
import datetime
start = datetime.datetime.now()
cube_sum = sum(
    map(
        lambda x: x * x * x,
        range(0, 100_000_000)
    )
)
print(f"Took {datetime.datetime.now() - start}")
print(f"cube_sum = {cube_sum}")
```

```
>>> run()
Took 0:00:09.076986
24999999500000002500000000000000
```

## In Rust?

```rust
fn main() {
    let start = std::time::Instant::now();
    let sum: u128 = (0..100_000_000u32)
        .into_iter()
        .map(|n| {
            let n = u128::from(n);
            n * n * n
        })
        .sum();
    println!("Took {:?}", start.elapsed());
    println!("sum = {sum}");
}
```

```
$ cargo run --release
   Compiling process v0.1.0 (/Users/jonathan/process)
    Finished release [optimized] target(s) in 0.34s
Took 45ns
sum = 24999999500000002500000000000000
```

## OK, but it's cheating

```rust
fn main() {
    let start = std::time::Instant::now();
    let sum: u128 = (0..100_000_000u32)
        .into_iter()
        .map(|n| {
            let n = u128::from(n);
            std::hint::black_box(n * n * n)
        })
        .sum();
    println!("Took {:?}", start.elapsed());
    println!("sum = {sum}");
}
```

```
$ cargo run --release
   Compiling process v0.1.0 (/Users/jonathan/process)
    Finished release [optimized] target(s) in 0.34s
Took 68.014583ms
sum = 24999999500000002500000000000000
```

## Let's use all our CPU cores...

```rust
// Import the rayon library
use rayon::prelude::*;

fn main() {
    let start = std::time::Instant::now();
    // We swap `into_iter` for `into_par_iter`
    let sum: u128 = (0..100_000_000u32)
        .into_par_iter()
        .map(|n| {
            let n = u128::from(n);
            std::hint::black_box(n * n * n)
        })
        .sum();
    println!("Took {:?}", start.elapsed());
    println!("sum = {sum}");
}
```

## Let's use all our CPU cores...

```
$ cargo add rayon
    Updating crates.io index
      Adding rayon v1.6.1 to dependencies.
$ cargo run --release
...
   Compiling rayon v1.6.1
   Compiling process v0.1.0 (/Users/jonathan/process)
    Finished release [optimized] target(s) in 2.38s
     Running `target/release/process`
Took 9.928125ms
sum = 24999999500000002500000000000000
```

## Sure, but C can do this too, right?

```
$ clang -o ./target/main src/main.c -O3 -mcpu=native -std=c17 && ./target/main
sum 0x13b8b5ae675d38cb7260b704000
Took 70.3 milliseconds
```

## And was getting that performance ... enjoyable?

```c
#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>
#include <time.h>

int main(int argc, char** argv) {
    uint64_t start = clock_gettime_nsec_np(CLOCK_MONOTONIC);
    __uint128_t x = 0;
    for(uint32_t idx = 0; idx < 100000000; idx++) {
        __uint128_t i = (__uint128_t) idx;
        volatile __uint128_t result = i * i * i;
        x += result;
    }
    uint64_t end = clock_gettime_nsec_np(CLOCK_MONOTONIC);
    printf("sum 0x%08llx%08llx\n", (unsigned long long) (x >> 64), (unsigned long long) x);
    printf("Took %.3g milliseconds\n", ((double) (end - start)) / (1000.0 * 1000.0) );
    return 0;
}
```

## 2) What about safety?

## Rust is *memory safe*

* It applies bounds checks to array and slice accesses
* You can't 'accidentally' go off the end of a buffer
* Massive reduction in bugs
* Where possible (e.g. the indicies are constant) those checks are optimised out

## Rust is *thread-safe*

* You cannot create race-hazards!
* Every value has one owner
* You can create either:
  * One exclusive, mutable, reference
  * Multiple shared, immutable, references
  * Never both!
* Checked at compile time
  * Or at run-time if required

## References cannot outlive the underlying item that they borrow

* Checked by the *Borrow Checker* at __compile-time__

## You cannot transfer ownership between threads unless the type supports that

* Rust *channels* require types to be marked as thread-safe
* Passing values when starting a spawed thread - same checks
* The ref-counting allocation type `Rc<T>` __is not__ thread-safe
* The __atomic__-ref-counting allocation type `Arc<T>` __is__ (but is slightly slower)
* Make the wrong choice? Compiler stops you!

## There's an escape hatch

* Where the compiler cannot verify the rules are upheld, you can tell it you've
  done the checks manually
* We create `unsafe { }` blocks
* Lets you access raw pointers (e.g. for memory-mapped I/O)
* When you audit/review the code, you pay close attention to these parts!

## You can describe parts of your API as `unsafe`

You are requiring the user to pay attention and do some manual checks

## 3) But can I be productive?

## Fully-feature cross-platform Standard Library

<div class="columns">
<div>

* Filesystem access and Path handling
* Heap allocation, with optional reference-counting
* Threads, with Mutexes, Condition Variables, and Channels
* Strings, and a powerful value formatting system
* Growable arrays, hash-tables, B-Trees

</div>
<div>

* First-class Unicode text support
* Networking support (IPv4/IPv6, TCP/UDP, etc)
* I/O traits for working with files, strings, sockets, etc
* Time handling: Duration and Instant
* Environment Variables and CLI arguments

</div>
</div>

## Much less time chasing down weird bugs

* *If it compiles, it'll probably work right*
* No data races across threads
* No double frees, buffer overflows

## Async Programming

* Third-party libraries (e.g. *tokio*) give you all that but with an asynchronous API
* Great if your code spends a lot of time *waiting* (for the disk, for the network)

## Tools like `rust-analyzer` have powerful auto-completion

* Filling in functions to meet a trait definition
* Covering all the arms in a match expression
* Importing modules or qualifying a given type

## Built in testing

* The test-runner compiles and runs:
  * All your unit tests
  * All your integration tests
  * All the code examples in your docs!
* It also compiles all your examples

## It's completely cross-platform

* Windows, Linux and macOS devs all working with the *same tools*
* You can build a single binary that is trivial to deploy

## OK, but what's the catch?

## You can't write C in Rust

* You have to think about memory up-front
  * Who owns any given value?
  * Who needs to borrow it and when?
  * Does it live long enough to satisfy those borrows?
  * Are you borrowing something that might move?

## Rust exposes underlying complexity

* Rust strings are always valid UTF-8, and not null-terminated
* C strings are null-terminated, and of unspecified encoding
* OS strings are 8-bit on some platforms and 16-bit on others (Windows)
* Paths on disk are not always valid Unicode
* You get: `String`/`&str`, `CString`/`&CStr`, `OsString`/`&OsStr`, `PathBuf`/`&Path`

## Rust doesn't interact well with C++ code

* Rust doesn't understand classes or templates
* Neither Rust nor C++ have a stable ABI
* Projects do exist to auto-generate bindings, like [cxx](https://crates.io/crates/cxx)

## Touching the hardware requires `unsafe`

Hardware is a blob of shared mutable state and you have to manually verify
    your access to it is correct

##  What you have works just fine

If it's safe enough, maintainable enough and fast enough, then you should keep it!

## It's early days for building critical-systems in Rust

 Ferrocene is good, but C and Ada have a multi-decade head start

## Is the juice worth the squeeze?

## Only you can decide!

But we can show you what other people have found...

## Some quotes...

<div class="columns">
<div>

* Microsoft SRC
* Azure
* Mozilla
* Google Chrome
* Cloudflare

</div>
<div>

* Amazon
* Linux Kernel developers
* The Unicode Consortium
* Dropbox
* Facebook

</div>
</div>

## Microsoft observe there's an issue:

> Tools and guidance are demonstrably not preventing this class of
> vulnerabilities; memory safety issues have represented almost the same
> proportion of vulnerabilities assigned a CVE for over a decade. We feel that
> using memory-safe languages will mitigate this in ways that tools and training
> have not been able to.

<https://msrc.microsoft.com/blog/2019/07/we-need-a-safer-systems-programming-language/>

## And they think Rust is one answer:

> We believe Rust changes the game when it comes to writing safe systems
> software. Rust provides the performance and control needed to write low-level
> systems, while empowering software developers to write robust, secure
> programs.

<https://msrc.microsoft.com/blog/2019/07/why-rust-for-safe-systems-programming/>

## Indeed, the CTO of Azure said in September 2022:

> Speaking of languages, it's time to halt starting any new projects in C/C++
> and use Rust for those scenarios where a non-GC language is required. For the
> sake of security and reliability, the industry should declare those languages
> as deprecated.

<https://twitter.com/markrussinovich/status/1571995117233504257>

## Mozilla use Rust in Firefox

> With the release of Firefox 48, we shipped the very first browser component to
> be written in the Rust programming language — an MP4 parser for video files.
> Streaming media files in your browser can be particularly risky if you don’t
> know or trust the source of the file, as these can maliciously take advantage
> of bugs in a browser’s code. Rust’s memory-safe capabilities prevent these
> vulnerabilities from being built into the code in the first place.

<https://blog.mozilla.org/en/products/firefox/put-trust-rust-shipping-now-firefox/>

## Now Google want to use Rust in Chrome

> Our goal in bringing Rust into Chromium is to provide a simpler and safer way
> to satisfy the rule of two, in order to speed up development and improve the
> security of Chrome. And we believe that we can use third-party Rust libraries
> to work toward this goal.

<https://security.googleblog.com/2023/01/supporting-use-of-rust-in-chromium.html>

## Cloudflare replaced NGINX with a custom service written in Rust:

> In production, Pingora consumes about 70% less CPU and 67% less memory
> compared to our old service with the same traffic load.

<https://blog.cloudflare.com/how-we-built-pingora-the-proxy-that-connects-cloudflare-to-the-internet/>

## Amazon are heavily invested in Rust:

> Here at AWS, we love Rust, too, because it helps AWS write highly performant,
> safe infrastructure-level networking and other systems software. Amazon’s
> first notable product built with Rust, Firecracker, launched publicly in 2018
> ..., but we also use Rust to deliver services such as S3, EC2, CloudFront,
> Route 53, and more ... Our Amazon EC2 team uses Rust as the language of choice
> for new AWS Nitro System components...

<https://aws.amazon.com/blogs/opensource/why-aws-loves-rust-and-how-wed-like-to-help/>

## Rust means Android has fewer bugs

> As the amount of new memory-unsafe code entering Android has decreased, so too
> has the number of memory safety vulnerabilities. From 2019 to 2022 it has
> dropped from 76% down to 35% of Android’s total vulnerabilities. 2022 is the
> first year where memory safety vulnerabilities do not represent a majority of
> Android’s vulnerabilities.

<https://security.googleblog.com/2022/12/memory-safe-languages-in-android-13.html>

## Rust is only the second ever support language for writing Linux Kernel Drivers

> Like we mentioned last time, the Rust support is still to be considered
> experimental. However, support is good enough that kernel developers can start
> working on the Rust abstractions for subsystems and write drivers and other
> modules.

<https://lore.kernel.org/lkml/20220117053349.6804-1-ojeda@kernel.org/>

## The Unicode Consortium write ICU4X in Rust

> Built from the ground up to be lightweight, portable, and secure, ICU4X learns
> from decades of experience to bring localized date formatting, number
> formatting, collation, text segmentation, and more to devices that, until now,
> did not have a suitable solution.

## The Unicode Consortium write ICU4X in Rust

> ICU4X supports multiple programming languages out of the box. ICU4X can be
> used in the Rust programming language natively, with official wrappers in C++
> via the foreign function interface (FFI) and JavaScript via WebAssembly. 

<http://blog.unicode.org/2022/09/announcing-icu4x-10.html>

## Dropbox re-wrote their Sync Engine in Rust:

> We wrote Nucleus in Rust! Rust has been a force multiplier for our team, and
> betting on Rust was one of the best decisions we made. More than performance,
> its ergonomics and focus on correctness has helped us tame sync’s complexity.
> We can encode complex invariants about our system in the type system and have
> the compiler check them for us.

<https://dropbox.tech/infrastructure/rewriting-the-heart-of-our-sync-engine>

## Facebook wrote their Mercurial server in Rust:

> [Our Rust Engineers] came from Python and Javascript backgrounds. They
> appreciated Rust’s combination of high performance with compile-time error
> detection. As more success stories, such as performance improvements at two to
> four orders of magnitude, circulated within the company, interest grew in
> using Rust for back-end service code and exploring its use in mobile apps as
> well.

<https://engineering.fb.com/2021/04/29/developer-tools/rust/>

## How can I get my team up to speed with Rust?

## Consultancy and Support

There are a growing number of Rust-based consultancies.

* [Ferrous Systems](https://www.ferrous-systems.com)
* [Integer32](https://www.integer32.com)
* [Tweede Golf](https://tweedegolf.nl/en)
* [CrabNebula](https://crabnebula.dev)

## Professional Training

Ferrous Systems offer professional training for small teams:

* €3,000 per person
* Just for you - groups of 5 to 12 people
* Spread over six half-days (6 x 4 hrs = 24 hrs)
* Our material is open-source: <https://github.com/ferrous-systems/teaching-material>
* Tailored to your needs and experience

## On-line Self-Taught Courses

* Take your first steps with Rust (from Microsoft)
  * <https://learn.microsoft.com/en-us/training/paths/rust-first-steps/>
* Rust By Example
  * <https://doc.rust-lang.org/stable/rust-by-example/>

## Desktop-based Self-Taught Courses

* Rustlings
  * <https://github.com/rust-lang/rustlings/>

## Project Documentation

* Standard Library Docs
  * <https://docs.rust-lang.org/std>
* Cargo
  * <https://doc.rust-lang.org/cargo>
* Rustdoc
  * <https://doc.rust-lang.org/rustdoc>
* Rustc
  * <https://doc.rust-lang.org/rustc>

## Working Group Materials

* The Embedded Book
  * <https://doc.rust-lang.org/embedded-book>
* The CLI Book
  * <https://rust-cli.github.io/book/>
* The WebAssembly Book
  * <https://rustwasm.github.io/docs/book/>

## Online Books

* The Rust Book
  * <https://doc.rust-lang.org/book/>
  * Also available in print
* Rust Atomics and Locks (Concurrency in Practice)
  * <https://marabos.nl/atomics/>
  * Also available in print

## Print Books and eBooks

* Rust in Action
* Rust for Rustaceans
