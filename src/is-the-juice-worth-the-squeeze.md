# Is the juice worth the squeeze?

## Only you can decide!

But we can show you what other people have found...

---

## Microsoft observe there's an issue:

<https://msrc.microsoft.com/blog/2019/07/we-need-a-safer-systems-programming-language/>

> Tools and guidance are demonstrably not preventing this class of
> vulnerabilities; memory safety issues have represented almost the same
> proportion of vulnerabilities assigned a CVE for over a decade. We feel that
> using memory-safe languages will mitigate this in ways that tools and training
> have not been able to.

---

## And they think Rust is one answer:

<https://msrc.microsoft.com/blog/2019/07/why-rust-for-safe-systems-programming/>

> We believe Rust changes the game when it comes to writing safe systems
> software. Rust provides the performance and control needed to write low-level
> systems, while empowering software developers to write robust, secure
> programs.

---

## Indeed, Azure CTO (and former SysInternals developer) said in September 2022:

<https://twitter.com/markrussinovich/status/1571995117233504257>

> Speaking of languages, it's time to halt starting any new projects in C/C++
> and use Rust for those scenarios where a non-GC language is required. For the
> sake of security and reliability. the industry should declare those languages
> as deprecated.

---

## Dropbox re-wrote their Sync Engine in Rust:

<https://dropbox.tech/infrastructure/rewriting-the-heart-of-our-sync-engine>

> We wrote Nucleus in Rust! Rust has been a force multiplier for our team, and
> betting on Rust was one of the best decisions we made. More than performance,
> its ergonomics and focus on correctness has helped us tame sync’s complexity.
> We can encode complex invariants about our system in the type system and have
> the compiler check them for us.

---

## Facebook wrote their Mercurial server in Rust:

<https://engineering.fb.com/2021/04/29/developer-tools/rust/>

> Many of the engineers at Facebook who adopted Rust came from Python and
> Javascript backgrounds. They appreciated Rust’s combination of high
> performance with compile-time error detection. As more success stories, such
> as performance improvements at two to four orders of magnitude, circulated
> within the company, interest grew in using Rust for back-end service code and
> exploring its use in mobile apps as well.

---

## Cloudflare replaced NGINX with a custom service written in Rust:

<https://blog.cloudflare.com/how-we-built-pingora-the-proxy-that-connects-cloudflare-to-the-internet/>

> In production, Pingora consumes about 70% less CPU and 67% less memory
> compared to our old service with the same traffic load.

---

## Amazon are heavily invested in Rust:

<https://aws.amazon.com/blogs/opensource/why-aws-loves-rust-and-how-wed-like-to-help/>

> Here at AWS, we love Rust, too, because it helps AWS write highly performant,
> safe infrastructure-level networking and other systems software. Amazon’s
> first notable product built with Rust, Firecracker, launched publicly in 2018
> and provides the open source virtualization technology that powers AWS Lambda
> and other serverless offerings. But we also use Rust to deliver services such
> as S3, EC2, CloudFront, Route 53, and more ... Our Amazon EC2 team uses Rust
> as the language of choice for new AWS Nitro System components...

---

## New code Rust code Android has less bugs

<https://security.googleblog.com/2022/12/memory-safe-languages-in-android-13.html>

> As the amount of new memory-unsafe code entering Android has decreased, so too
> has the number of memory safety vulnerabilities. From 2019 to 2022 it has
> dropped from 76% down to 35% of Android’s total vulnerabilities. 2022 is the
> first year where memory safety vulnerabilities do not represent a majority of
> Android’s vulnerabilities.

---

## Rust is only the second ever support language for writing Linux Kernel Drivers

<https://www.kernel.org/doc/html/next/rust/index.html>

> The docs can also be easily generated and read locally. This is quite fast
> (same order as compiling the code itself) and no special tools or environment
> are needed. This has the added advantage that they will be tailored to the
> particular kernel configuration used. To generate them, use the rustdoc target
> with the same invocation used for compilation, e.g. `make LLVM=1 rustdoc`