# The RPG Language

A guide to the [RPG programming language](https://en.wikipedia.org/wiki/IBM_RPG) for the modern programmer.

This repo is intended to be a comprehensive introduction to the language. Some knowledge about [IBM I](https://en.wikipedia.org/wiki/IBM_i) and [IBM I project explorer](https://ibm.github.io/vscode-ibmi-projectexplorer/#/) is recommended.

You can check my two repos for some context: [IBM i operating system](https://github.com/kraudy/ibmi_os) and [IBM-i-pipeline](https://github.com/kraudy/IBM-i-pipeline)

As our source material, we will be using the incredible red book [Who Knew You Could Do That with RPG IV? Modern RPG for the Modern Programmer](https://www.redbooks.ibm.com/redbooks/pdfs/sg245402.pdf) 

# Table of Contents

- [Context](#context)

# Context

The RPG language has been moving the financial sector in the shadows for a long time, similar to [COBOL](https://en.wikipedia.org/wiki/COBOL). They are both old school languages, but don't let that fool you; they are also modern languages, and now, more than ever, more developers are needed that understand these languages. 

All the old programmers are retiring, and new young blood is needed not only to keep the banking system around the world moving but also to modernize these legacy systems and take them to a whole new level that has never been seen before, leveraging new and open-source technology on these paleolithic business processes. 

This is the purpose of this repo, to bring more new developers into the RPG/IBM world.

# Intro

Ok, but, what is RPG? It is a [procedural/imperative](https://en.wikipedia.org/wiki/Procedural_programming) programming language for the [IBM I](https://en.wikipedia.org/wiki/IBM_i) operating system. 

RPG stands for Report Program Generator. It was crated for the business world. 

This was the idea: You have a file with client information that needs to be processed. Define the file at the top of the program and have it automatically load each register one at a time into global variables that match the column names of the file, do some operation or calculation with them, update the same file or another file of the system with the new information and close all the opened files pointers, finish the program, and return the control to the operating system.

Sounds simple, but here is the thing. RPG came after the world of assembler; programmers were used to assembly code. So, when a new higher-level language was needed, they decided, Ok, let's make a better assembly. Thinking this way, the syntax of the new language was similar to assembly; you have the operation on the left and the operand on the right, all in a column fashion. This is known as **columnar** RPG and is the legacy RPG syntax. Most of the RPG source code is still written in columnar RPG and the new developments are done (or should be done) in modern **free** RPG, which uses a syntax more common to modern developers that is similar to the C language.


## OPM

The legacy RPG programming was not only columnar, it also included the environmente where it was programmed. 

There were no local variables and functions; everything was global variables and something called **subroutines,** which are not really functions; they are more similar to defined **tags** where the execution logic can do a **GOTO** to jump in, and after finishing it jumps back to where it was. 

Since there were no functions or local variables, there was no idea of modularization or procedure driven logic (again, remember the assembly mindset). All programs were a monolithic 10 thousands lines of code with 1,000 global variables. 

This environment was called **OPM (Original Program Model)**. As you may tell, this way of programming was highly error-prone and difficult to maintain. Needless to say, if you change a program, you need to recompile it and recompile everything that is affected by that program. So, a better way of doing things was needed.

> Remember that this was done on a [5250 terminal](https://en.wikipedia.org/wiki/IBM_5250) green screen using [SEU](https://www.nicklitten.com/course/what-is-seu-source-entry-utility/).

## ILE


