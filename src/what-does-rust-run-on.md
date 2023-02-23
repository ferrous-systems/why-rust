# What does Rust run on?

---

## Host vs Target

* The machine you develop on
* The machine the program runs on

---

## Rust is a cross-compiler

* It uses LLVM to generate machine code
* *Every* Rust install is a cross-compiler
  * No rummaging for extra installers for your platform

---

## Hosts

* Windows (__x86__, __x86-64__, Aarch64)
* macOS (__x86-64__, Aarch64)
* Linux (__x86__, __x86-64__, __Aarch64__, RISC-V, Arm v6, Arm v7, MIPS, PowerPC, S390x)
* FreeBSD, NetBSD, Illumos, ...

---

## Targets

* All of the above, plus...
* Bare-metal Embedded
* WebAssembly
* Android
* iOS/watchOS/tvOS
* UEFI
* Nintendo Switch, 3DS and GBA
* Sony Playstation and PS Vita
* Add your own!
