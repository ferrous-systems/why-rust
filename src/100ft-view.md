# The 100-foot view

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
.columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
}
</style>

---

## A free and open-source __systems programming__ language

> A language empowering everyone to build reliable and efficient software.

```rust
fn main() {
    println!("Hello, world!");
}
```

---

## You can build...

<div class="columns">
<div>

* Network Services
* Command-line Apps
* Web Apps
* Desktop Apps
* Bootloaders

</div>
<div>

* Device Drivers
* Hypervisors
* Embedded Systems
* Libraries/plugins for applications in other languages

</div>
</div>

---

## Front-end or Back-end?

* It's applicable at *every point* in the stack

---

# Fast
# Safe
# Productive

---

## It's increasingly popular!

* [Stack Overflow Most Loved Language](https://survey.stackoverflow.co/2022/#section-most-loved-dreaded-and-wanted-programming-scripting-and-markup-languages)

* > Rust is on its seventh year as the most loved language with 87% of developers saying they want to continue using it.

---

## Cross-platform

* Windows, macOS, Linux
* iOS, Android, Web, Bare-metal, etc

---

## Source code is portable across multiple architectures

* Intel/AMD and Arm
* Power, MIPS, SPARC, ...

---

## Rust can *import* C-compatible libraries

* Want to use `zlib`, `OpenSSL`, `SomeSpecialDriverLib`? Sure!

---

## Rust can *export* C-compatible libraries

* Python extension modules? Ok!
* Android native libraries? No problem.
* Replace the file parser in your Very Large C++ Application? Can-do.
    * See [Firefox](https://wiki.mozilla.org/Oxidation)
