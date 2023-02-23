# Is the juice worth the squeeze?

---

## Only you can decide!

But we can show you what other people have found...

---

## Microsoft observe there's an issue:

> Tools and guidance are demonstrably not preventing this class of
> vulnerabilities; memory safety issues have represented almost the same
> proportion of vulnerabilities assigned a CVE for over a decade. We feel that
> using memory-safe languages will mitigate this in ways that tools and training
> have not been able to.

<https://msrc.microsoft.com/blog/2019/07/we-need-a-safer-systems-programming-language/>

---

## And they think Rust is one answer:

> We believe Rust changes the game when it comes to writing safe systems
> software. Rust provides the performance and control needed to write low-level
> systems, while empowering software developers to write robust, secure
> programs.

<https://msrc.microsoft.com/blog/2019/07/why-rust-for-safe-systems-programming/>

---

## Indeed, Azure CTO (and former SysInternals developer) said in September 2022:

> Speaking of languages, it's time to halt starting any new projects in C/C++
> and use Rust for those scenarios where a non-GC language is required. For the
> sake of security and reliability. the industry should declare those languages
> as deprecated.

<https://twitter.com/markrussinovich/status/1571995117233504257>

---

## Mozilla use Rust in Firefox

> With the release of Firefox 48, we shipped the very first browser component to
> be written in the Rust programming language — an MP4 parser for video files.
> Streaming media files in your browser can be particularly risky if you don’t
> know or trust the source of the file, as these can maliciously take advantage
> of bugs in a browser’s code. Rust’s memory-safe capabilities prevent these
> vulnerabilities from being built into the code in the first place.

<https://blog.mozilla.org/en/products/firefox/put-trust-rust-shipping-now-firefox/>

---

## Now Google want to use Rust in Chrome

> Our goal in bringing Rust into Chromium is to provide a simpler (no IPC) and
> safer (less complex C++ overall, no memory safety bugs in a sandbox either)
> way to satisfy the rule of two, in order to speed up development (less code to
> write, less design docs, less security review) and improve the security
> (increasing the number of lines of code without memory safety bugs, decreasing
> the bug density of code) of Chrome. And we believe that we can use third-party
> Rust libraries to work toward this goal.

<https://security.googleblog.com/2023/01/supporting-use-of-rust-in-chromium.html>

---

## Cloudflare replaced NGINX with a custom service written in Rust:

> In production, Pingora consumes about 70% less CPU and 67% less memory
> compared to our old service with the same traffic load.

<https://blog.cloudflare.com/how-we-built-pingora-the-proxy-that-connects-cloudflare-to-the-internet/>

---

## Amazon are heavily invested in Rust:

> Here at AWS, we love Rust, too, because it helps AWS write highly performant,
> safe infrastructure-level networking and other systems software. Amazon’s
> first notable product built with Rust, Firecracker, launched publicly in 2018
> and provides the open source virtualization technology that powers AWS Lambda
> and other serverless offerings. But we also use Rust to deliver services such
> as S3, EC2, CloudFront, Route 53, and more ... Our Amazon EC2 team uses Rust
> as the language of choice for new AWS Nitro System components...

<https://aws.amazon.com/blogs/opensource/why-aws-loves-rust-and-how-wed-like-to-help/>

---

## Rust means Android has fewer bugs

> As the amount of new memory-unsafe code entering Android has decreased, so too
> has the number of memory safety vulnerabilities. From 2019 to 2022 it has
> dropped from 76% down to 35% of Android’s total vulnerabilities. 2022 is the
> first year where memory safety vulnerabilities do not represent a majority of
> Android’s vulnerabilities.

<https://security.googleblog.com/2022/12/memory-safe-languages-in-android-13.html>

---

## Rust is only the second ever support language for writing Linux Kernel Drivers

> Like we mentioned last time, the Rust support is still to be considered
> experimental. However, support is good enough that kernel developers can start
> working on the Rust abstractions for subsystems and write drivers and other
> modules.

<https://lore.kernel.org/lkml/20220117053349.6804-1-ojeda@kernel.org/>

---

## The Unicode Consortium write ICU4X in Rust

> Built from the ground up to be lightweight, portable, and secure, ICU4X learns
> from decades of experience to bring localized date formatting, number
> formatting, collation, text segmentation, and more to devices that, until now,
> did not have a suitable solution.

> ICU4X supports multiple programming languages out of the box. ICU4X can be
> used in the Rust programming language natively, with official wrappers in C++
> via the foreign function interface (FFI) and JavaScript via WebAssembly. 

<http://blog.unicode.org/2022/09/announcing-icu4x-10.html>

---

## Dropbox re-wrote their Sync Engine in Rust:

> We wrote Nucleus in Rust! Rust has been a force multiplier for our team, and
> betting on Rust was one of the best decisions we made. More than performance,
> its ergonomics and focus on correctness has helped us tame sync’s complexity.
> We can encode complex invariants about our system in the type system and have
> the compiler check them for us.

<https://dropbox.tech/infrastructure/rewriting-the-heart-of-our-sync-engine>

---

## Facebook wrote their Mercurial server in Rust:

> Many of the engineers at Facebook who adopted Rust came from Python and
> Javascript backgrounds. They appreciated Rust’s combination of high
> performance with compile-time error detection. As more success stories, such
> as performance improvements at two to four orders of magnitude, circulated
> within the company, interest grew in using Rust for back-end service code and
> exploring its use in mobile apps as well.

<https://engineering.fb.com/2021/04/29/developer-tools/rust/>
