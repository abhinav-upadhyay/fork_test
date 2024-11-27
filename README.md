# fork_test
A sample program to demonstrate the use of fork and execve system calls on Linux.

This repository support code for my article explaining the [internals of the fork system call](https://blog.codingconfessions.com/p/the-magic-of-fork).

-----
## Building
There are two programs here, one is a C program in fork_test.c and a similar program but in x86 assembly in fork.s file.

To compile both of these, you need to have GNU Make installed on your system. To build, simple run `make` on the command line.

It will generate two binaries: `fork_test` from fork_test.c and `fork` from fork.s.  




