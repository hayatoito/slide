# How the computer works

hayato@google.com

<!--
All images refered from slide deck: Copyright © 2018 Cake Labs, Inc.
See https://www.interviewcake.com/article/python/data-structures-coding-interview
-->

---

# Example 1

```python
# python

a = 1
b = a
b = 2

print('a:', a)
print('b:', b)
```

---

# Example 1: Result

```python
# python

a = 1
b = a
b = 2

print('a:', a)
print('b:', b)
```

```
a: 1
b: 2
```

---

# Example 2

```python
# python

a = [1]
b = a
b.append(2)

print('a:', a)
print('b:', b)
```

---

# Example 2: Result

```python
# python

a = [1]
b = a
b.append(2)

print('a:', a)
print('b:', b)
```

```
a: [1, 2]
b: [1, 2]
```

---

# Example 3

```python
# python

def foo(b):
    b = 2

a = 1
foo(a)
print('a:', a)
```

---

# Example 3: Result

```python
# python

def foo(b):
    b = 2

a = 1
foo(a)
print('a:', a)
```

```
a: 1
```

---

# Example 4

```python
# python

def foo(b):
    b.append(2)

a = [1]
foo(a)
print('a:', a)
```

---

# Example 4: Result

```python
# python

def foo(b):
    b.append(2)

a = [1]
foo(a)
print('a:', a)
```

```
a: [1, 2]
```

---

# Example 5

```python
# python

def foo(b):
    b.append(2)
    b = b + [3]
    b.append(4)
    print('b:', b)

a = [1]
foo(a)
print('a:', a)
```

---

# Example 5 (Answer)

```python
# python

def foo(b):
    b.append(2)
    b = b + [3]
    b.append(4)
    print('b:', b)

a = [1]
foo(a)
print('a:', a)
```

```
b: [1, 2, 3, 4]
a: [1, 2]
```

---

# Memory

---

RAM (Random Access Memory)

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_empty_no_indices.svg)

---

Address

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_empty_with_indices.svg)

---

1 byte == 8 bits

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_bits.svg)

---

Processor

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_processor.svg)

---

Memory Controller

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_memory_controller.svg)

---

Cache

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_cache.svg)

---

# Binary Numbers

---

base 10

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__binary_numbers_base_10.svg)

---

base 2

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__binary_numbers_base_2.svg?bust=175)

---

How many different numbers can we express <br> with 1 byte (8 bits)?

---

2<sup>8</sup> => 256

---

32-bit integers (4 bytes)

- 2<sup>32</sup> => more than 4 billion
- e.g. `int` in Java

---

64-bit integers (8 bytes)

- 2<sup>64</sup> => more than 10 billion billion (10<sup>19</sup>)
- e.g. `long` in Java

---

fixed-width integers: O(1) space

- `int` in Java: 4 bytes
- `long` in Java: 8 bytes

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_bits.svg)

---

fixed-width integers: O(1) time

- Simple operations: (+, -, \*, /)

---

# Arrays (配列)

---

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__array_kombucha_counts.svg)

---

Another program had already stored some information

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__array5_occupied.svg)

---

Array index -> Find the memory address

- index 0 -> memory address 3 (== 3 + 0)
- index 1 -> memory address 4 (== 3 + 1)
- index 2 -> memory address 5 (== 3 + 2)
- ...

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__array5.svg?bust=175)

---

{address of `N` th item in array} <br> == { address of array start } + { `N` }

---

an array of 64-bit (8 byte) integers

- index 0 -> memory address 0 (== 0 + 0 \* 8)
- index 1 -> memory address 8 (== 0 + 1 \* 8)
- index 2 -> memory address 16 (== 0 + 2 \* 8)
- ...

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__array64_long.svg)

---

{address of `N` th item in array} <br>

== {address of array start} + (N \* {size of each item in bytes})

---

Array: O(1) lookup time

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__arrays_no_processor_ram_memory_controller.svg)

---

Array

- Each item in the array is the same size
- The array is uninterrupted (contiguous) in memory
- index n -> {address of array start} + (n \* {size of each item in bytes})

---

# Strings

"ABCD"

---

character encoding: ASCII

- 'A' == 01000001 (65)
- 'B' == 01000010 (66)
- 'C' == 01000011 (67)
- ...

See "`man ascii`"

---

String as an array of 8-bit <strike>numbers</strike> (characters)

- "NICE" can be repsetend as:

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__strings_nice_array.svg?bust=175)

---

# Exercise 1

How to store a list of strings in memory?

```python
# python

["Wilgglesworth", "foo", "bar"]
```

---

One possible idea

- Wasted space

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__pointers_baby_names.svg)

---

# Pointers

---

- Store an array of pointers to strings
- pointer == points to another spot in address

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__pointers_pointer_array.svg?bust=175)

---

# Benefits

- The items, "Wig....", "Bill", don't have to be the same length
- We don't need enough uninterrupted free memory to store all string next to
  each other

---

# Tradeoff

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__ram_cache.svg?bust=175)

- Original Array: **cache-friendly**
- the pointers in this arrray: **not cache-friendly**
- **still O(1) time**

---

# Dynamic Arrays <br> (動的配列 / <br> 可変長配列)

---

# Exercise 2

```python
# python

a = ["Wigglesworth", "Bill"]
a.append("Hello")  # What will happen?
```

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__pointers_pointer_array.svg?bust=175)

---

Dynamic Arrays

- Starting size: 10 (== **Capacity**)

```python
# python

a = []
```

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_10_indices.svg)

---

- Append 4 items:

```python
# python

a.append('D');
a.append('e');
a.append('a');
a.append('r');
...
```

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_dear.svg)

---

- **size** is 4 and its **capacity** is 10.

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_size_and_capacity.svg)

---

Dynamic Array

| field                         | value                   |
| ----------------------------- | ----------------------- |
| start address                 | 0xffee88                |
| size (the number of items)    | 4                       |
| capacity                      | 10                      |
| (_size of each item_ in bytes | (8) (e.g. (`Vec<u64>`)) |

=> 96 bytes in total

---

Capacity is full

```python
# python

a.append('D');
a.append('e');
a.append('a');
a.append('r');
...
a.append('e');
# a.append('r');  # What will happen?
```

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_array_sweatin.svg?bust=175)

---

[1/4] Make a new, bigger array

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_new_array.svg)

---

[2/4] Copy each element from the old array into the new array.

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_copy_array.svg?bust=175)

---

[3/4] Free up the old array

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_free_old_array.svg)

---

[4/4] Append your new item.

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__dynamic_arrays_append_item.svg)

---

Append is O(1) or O(n) ?

=> Your homework

---

Dynamic Arrays: Tradeoff

- You don't have to specify the size ahead of time
- some appnends can be expensive

---

# Linked Lists <br> (連結リスト)

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_sample.svg)

---

Linked Lists in Memory

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_in_memory.svg)

---

They don't have to be _in order_

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_in_memory_out_of_order.svg)

---

head and tail

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string.svg?bust=175)

---

Add an "S" to the end. How?

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string_add_node.svg)

---

1/4. Grab the last letter, "G"

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_logs_string_grab_last_letter.svg)

---

2/4. Update "G"s `next`

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_logs_string_point_next.svg)

---

3/4. Update `tail`

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_logs_string_tweak_pointers.svg)

---

Linked List: Append = O(1)

---

Prepend "B"

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_logs_string_add_node.svg)

---

1.  Point "B"'s `next` to "L"
2.  Point the `head` to "B"

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_blogs_string_tweak_pointers.svg)

---

# Exercise 3

Prepend for dynamic arrays

```python
# python

a = ['L', 'O', 'G', 'S']
a.insert(0, 'B');  # What will happen?
```

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string_dynamic_array_add_b.svg)

---

1/2: Move each item

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string_dynamic_array_move_s.svg)
![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string_dynamic_array_move_g.svg)

---

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string_dynamic_array_move_o.svg)
![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string_dynamic_array_move_l.svg)

---

2/2: Put "B" finally

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__linked_lists_log_string_dynamic_array_chars_moved.svg)

---

# Exercise 4

What's wrong?

```python
# python

a = [100, 101, 102, ,,,,, 199]
b = [99, 98, 97, ...., 2, 1, 0]
for i in b:
    a.insert(0, i)
print(a)
```

```
[0, 1, 2, 3, ....., 198, 199]
```

---

# Hash tables

---

Character counter:

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__hash_tables_chars_to_ints.svg)

---

Word counter?

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__hash_tables_lies_key_unlabeled.svg)

---

Hash functions

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__hash_tables_lies_chars.svg)

423 % 30 = 9

---

- key -> (hash function) -> address -> value

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__hash_tables_lies_key_labeled.svg)

---

hash collision

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__hash_tables_lies_and_foes_addition.svg)

---

![](https://www.interviewcake.com/images/svgs/cs_for_hackers__hash_tables_hash_collision_key_val.svg)

---

# Summary

- Each data structure has tradeoffs.
- Be familiar with data structures in programming languages

---

|        | Dynamic Array | Hash Map / Hash Set           | Binary Tree (Map / Set) |
| ------ | ------------- | ----------------------------- | ----------------------- |
| Rust   | Vec           | HashMap / HashSet             | BTreeMap / BTreeSet     |
| C++    | vector        | unordered_map / unordered_set | map / set               |
| Python | list          | dict / set                    | -                       |
| Java   | ArrayList     | HashMap / HashSet             | TreeMap / TreeSet       |
| C      | -             | -                             | -                       |

---

# Appendix

---

# `id` in Python

`id(x)` ==> Address of _object_ x

---

# Example A

Explain what is happening in memory.

```python
# python

a = 1
b = 2
print('id(a):', id(a))
print('id(b):', id(b))
b = a
print('id(a):', id(a))
print('id(b):', id(b))
```

```
id(a): 10844768
id(b): 10844800
id(a): 10844768
id(b): 10844768
```

---

# Example B

Explain what is happening in memory.

```python
# python

a = 1
print('id(a):', id(a))
a = a + 2
print('id(a):', id(a))
```

```
id(a): 10844768
id(a): 10844832
```

---

# Example C

```python
# python

a = [1, 2]
b = [a]
print('id(a):', id(a))
print('id(b):', id(b))
print('id(b[0]):', id(b[0]))
b[0].append(3)
print('>> b[0].append(3)')
print('a:', a)
```

```
id(a): 140164668674568
id(b): 140164668674504
id(b[0]): 140164668674568
>> b[0].append(3)
a: [1, 2, 3]
```

---

# The Final Example

```python
a = [1]
a.append(a)
print(a)
```

---

# TSP Assignment

- Code readability
- Learn how to collaborate with others
- Try to avoid _unnecessary_ O(N) or O(N^2)
- Algorithm matters

---

# Code Readability

Code should be written to minimize the time it would take for someone else to
understand it.

---

# P vs NP

- [P vs NP](https://en.wikipedia.org/wiki/P_versus_NP_problem)

- NP-Hard, NP-Complete

  - [Graph Coloring](https://en.wikipedia.org/wiki/Graph_coloring)
  - [Mine Sweeter](http://web.mat.bham.ac.uk/R.W.Kaye/minesw/ordmsw.htm)
  - [Puyo Puyo](http://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/1426-24.pdf)

---

Brute-Force (全探索)

- For N = 5, 8
- https://en.wikipedia.org/wiki/Brute-force_search
- [permutations](https://en.wikipedia.org/wiki/Permutation)
- O(N!)

---

Dynamic Programming (動的計画法)

- For N = 16
- https://en.wikipedia.org/wiki/Memoization
- O(N!) => O(2^N N)
- Divide a problem into small problems

---

Heuristic (ヒューリスティック)

- For large N (>= 64)
- https://en.wikipedia.org/wiki/Heuristic
- [Greedy (貪欲法)](https://en.wikipedia.org/wiki/Greedy_algorithm)
- You can find a bettr way!

---

Speed Challenge

- Programming Language matters:
  - Rust, C, C++, Haskell, OCaml
