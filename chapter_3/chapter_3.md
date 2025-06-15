# Chapter three: Programming

Modern RPG programming is procedure-driven. Each procedure can be seen as a context of execution with its own containerized logic and local variables along with an interface that defines what values it receives and returns. 

## Content

- []()
- []()
- []()
- []()
- []()

## Procedures

A procedure or function is similar to a mathematical function, hence the same name. It takes some input, `x`, applies some series of operations on the data `f(x)` and produces an output `y`: `y = f(x)`.

A program can be viewed as a series of procedures or functions that perform a series of operations on some data. Execution is not always linear, and some decisions need to be made at certain points based on the data, which resembles an automata.

Modern machines are mostly based on the Von Neumann architecture, where data and operations are both stored in memory. This is why the program instructions and data are both loaded from memory to registers to be executed. Instructions and data are not so distinct.

Lests do a simple [square](./qrpglesrc/procs.pgm.rpgle#20) example : `y = x^2`

```js
CRTBNDRPG PGM(*CURLIB/procs) 
SRCSTMF('chapter_3/qrpglesrc/procs.pgm.rpgle') 
OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTCCSID(*JOB)
```

Just call it `CALL PGM(*curlib/PROCS) PARM((8))`
<div style="text-align: center;">
  <img src="../images/chapter_3/square_output.png" alt="pgm_from_crtbndrpg" style="display: inline-block;">
</div>

## Variables


## Arrays


## Data Structures


## Control logic
