# But can I be productive?

<style>
.columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
}
</style>

---

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

---

## Much less time chasing down weird bugs

* *If it compiles, it'll probably work right*
* No data races across threads
* No double frees, buffer overflows

---

## Async Programming

* Third-party libraries (e.g. *tokio*) give you all that but with an asynchronous API
* Great if your code spends a lot of time *waiting* (for the disk, for the network)

---

## Tools like `rust-analyzer` have powerful auto-completion

* Filling in functions to meet a trait definition
* Covering all the arms in a match expression
* Importing modules or qualifying a given type

---

## Built in testing

* The test-runner compiles and runs:
  * All your unit tests
  * All your integration tests
  * All the code examples in your docs!
* It also compiles all your examples

---

## It's completely cross-platform
  * Windows, Linux and macOS devs all working with the *same tools*
  * You can build a single binary that is trivial to deploy