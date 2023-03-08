# So it's fast, what about safety?

---

## Rust is *memory safe*

* It applies bounds checks to array and slice accesses
* You can't 'accidentally' go off the end of a buffer
* Massive reduction in bugs
* Where possible (e.g. the indicies are constant) those checks are optimised out

---

## Rust is *thread-safe*

* You cannot create race-hazards!
* Every value has one owner
* You can create either:
  * One exclusive, mutable, reference
  * Multiple shared, immutable, references
  * Never both!
* Checked at compile time
  * Or at run-time if required

---

## References cannot outlive the underlying item that they borrow

* Checked by the *Borrow Checker* at __compile-time__

---

## You cannot transfer ownership between threads unless the type supports that

* Functions that move between threads require types to be `Send`
* The reference-counting heap allocation handle `Rc<T>` __is not__ `Send`
* The atomic-reference-counting heap allocation handle `Arc<T>` __is__ `Send`

---

## You cannot transfer references between threads unless the type supports that

* Functions that copy references between threads require the types to be `Sync`
* A `Mutex<T>` is `Sync` if the underlying `T` is `Send`

---

## There's an escape hatch

* Where the compiler cannot verify the rules are upheld, you can tell it you've
  done the checks manually
* We create `unsafe { }` blocks
* Lets you access raw pointers (e.g. for memory-mapped I/O)
* When you audit/review the code, you pay close attention to these parts!

---

## You can describe parts of your API as `unsafe`

* You are requiring the user to pay attention and do some manual checks
