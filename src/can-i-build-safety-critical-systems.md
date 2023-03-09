# Can I build safety-critical systems?

---

## Some terminology

* You *certify* that a *system* is safe/correct
* You usually elect to build that *system* using *qualified* components (like
  toolchains)
* *Quality* is the result of an ongoing process

---

## What is a safety-critical system?

Generally built following to a standard, like ISO 26262:

> ISO 26262 is intended to be applied to safety-related systems that include one
> or more electrical and/or electronic (E/E) systems and that are installed in
> series production passenger cars with a maximum gross vehicle mass up to 3500
> kg.

> This document describes a framework for functional safety to assist the
> development of safety-related E/E systems. This framework is intended to be
> used to integrate functional safety activities into a company-specific
> development framework.

---

## And for other applications:

* DO-178C *Software Considerations in Airborne Systems and Equipment
  Certification*
* IEC 61508 *Functional Safety of Electrical/Electronic/Programmable Electronic
  Safety-related Systems*
* IEC 62278 *Railway applications - Specification and demonstration of
  reliability, availability, maintainability and safety*
* IEC 62034 *Medical device software – Software life cycle processes*
* There are many others...

---

## Can I use Rust?

* Well you can use C
* And C is kinda risky...
* But processes have been developed to manage that risk
* And tools have been pre-qualified so you can rely on them doing what they say
  they are going to do

---

## Language Specifications

* C has *ISO/IEC 9899:2018* (C17)
* C++ has *ISO/IEC 14882:2020(E)* (C++20)
* Rust doesn't have a standard
  * The open-source compiler *is* the standard
  * The first ISO C standard (C90) came 17 years after C was invented, largely
    because there were a lot of different competing compilers

---

## Ferrocene

> Ferrocene will be an ISO26262 qualified version of the existing open-source
> compiler, `rustc`. Ferrocene will be first made available to customers in the
> ISO 26262 space, with others like DO-178C, IEC 61508 and IEC 62278 in mind.

* A Ferrous Systems and AdaCore joint venture
* To produce Ferrocene, they first wrote the *Ferrocene Language Specification*
  * See <https://spec.ferrocene.dev>
* Ferrocene is based on the open-source Rust compiler
  * Additional testing and run-time checks in the toolchain
  * Lots of documentation!
* Pricing and support options available in due course
