# Is this a community I can engage with?

---

## A strong Code of Conduct

* The Rust Project, and pretty much the whole Community, follow a [Code of
  Conduct](https://www.rust-lang.org/policies/code-of-conduct)
* > We are committed to providing a friendly, safe and welcoming environment for
  > all, regardless of level of experience, gender identity and expression,
  > sexual orientation, disability, personal appearance, body size, race,
  > ethnicity, age, religion, nationality, or other similar characteristic.
* > Likewise any spamming, trolling, flaming, baiting or other
  > attention-stealing behavior is not welcome.
* Builds on efforts in other communities

---

## Why?

* Because a community is only as strong as its members
* > Going beyond technical points, Rust has a vibrant, welcoming community
  * [Stackoverflow Blog](https://stackoverflow.blog/2020/01/20/what-is-rust-and-why-is-it-so-popular/)
* If you allow both wolves *and* sheep into your space, you won't get any sheep
* The Rust Community seems to have a higher than average representation from the
  LGBTQI+ community

---

## So beginners are welcome?

* Absolutely!
* Relatively speaking, we're *all* still beginners
* You even see open tickets on the rust-lang Github marked as *E-easy: Good
  first issue*.

---

## This extends to the compiler's interface...

* Any Rust error message which is unclear or ambiguous...
* ... is considered a bug and will be fixed ...
* ... if you open a ticket (or tweet @ the right people)

---

## Compiler Error Driven Development works!

```
error[E0502]: cannot borrow `name` as mutable because it is also borrowed as immutable
 --> a.rs:4:5
  |
3 |     let nickname = &name[..3];
  |                     ---- immutable borrow occurs here
4 |     name.clear();
  |     ^^^^^^^^^^^^ mutable borrow occurs here
5 |     println!("Hello there, {}!", nickname);
  |                                  -------- immutable borrow later used here

For more information about this error, try `rustc --explain E0502`.
```
