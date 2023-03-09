# Is Rust fast?

---

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

---

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

---

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

---

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

---

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

---

## Sure, but C can do this too, right?

```
$ clang -o ./target/main src/main.c -O3 -mcpu=native -std=c17 && ./target/main
sum 0x13b8b5ae675d38cb7260b704000
Took 70.3 milliseconds
```

---

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
