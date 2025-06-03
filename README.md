# The RPG Language

A guide to the [RPG programming language](https://en.wikipedia.org/wiki/IBM_RPG) for the modern programmer.

This repo is intended to be a comprehensive introduction to the language. Some knowledge about [IBM I](https://en.wikipedia.org/wiki/IBM_i) and [IBM I project explorer](https://ibm.github.io/vscode-ibmi-projectexplorer/#/) is recommended.

You can check my two repos for some context: [IBM i operating system](https://github.com/kraudy/ibmi_os) and [IBM-i-pipeline](https://github.com/kraudy/IBM-i-pipeline)


# Table of Contents

- [Context](#context)
- [Intro](#intro)
- [Environment](#environment)
  - [OPM](#opm)
  - [ILE](#ile)
  - [Structure of a RPG program](#structure-of-a-rpg-program)
  - [Operating system](#operating-system)
- [The tools](#the-tools)
- [Chapters](#chapters)

# Context

The RPG language has been moving the financial sector in the shadows for a long time, similar to [COBOL](https://en.wikipedia.org/wiki/COBOL). They are both old school languages, but don't let that fool you; they are also modern languages, and now, more than ever, more developers are needed that understand these languages. 

All the old programmers are retiring, and new young blood is needed not only to keep the banking system around the world moving but also to modernize these legacy systems and take them to a whole new level that has never been seen before, leveraging new and open-source technology on these paleolithic business processes. 

This is the purpose of this repo, to bring more new developers into the RPG/IBM world.

# Intro

Ok, but, what is RPG? It is a [procedural/imperative](https://en.wikipedia.org/wiki/Procedural_programming) programming language for the [IBM I](https://en.wikipedia.org/wiki/IBM_i) operating system. 

RPG stands for Report Program Generator. It was crated for the business world. 

This was the idea: You have a file with client information that needs to be processed. Define the file at the top of the program and have it automatically load each register one at a time into global variables that match the column names of the file, do some operation or calculation with them based on **indicators** turned on or off, update the same file or another file of the system with the new information and close all the opened files pointers, finish the program, and return the control to the operating system.

> This logic was known as the **RPG Cycle**. This idea comes from the [FARGO (programming language)](https://en.wikipedia.org/wiki/FARGO_(programming_language)) and the [Tabulating machine](https://en.wikipedia.org/wiki/Tabulating_machine)

Sounds simple, but here is the thing. RPG came after the world of assembler; programmers were used to assembly code. So, when a new higher-level language was needed, they decided, Ok, let's make a better assembly. Thinking this way, the syntax of the new language was similar to assembly; you have the operation on the left and the operand on the right, all in a column fashion. This is known as **columnar** RPG and is the legacy RPG syntax. Most of the RPG source code is still written in columnar RPG and the new developments are done (or should be done) in modern **free** RPG, which uses a syntax more common to modern developers that is similar to the C language.

# Environment

## OPM

The legacy RPG programming was not only columnar, it also included the environmente where it was programmed. 

There were no local variables and functions; everything was global variables and something called **subroutines,** which are not really functions; they are more similar to defined **tags** where the execution logic can do a **GOTO** to jump in, and after finishing it jumps back to where it was. 

Since there were no functions or local variables, there was no idea of modularization or procedure driven logic (again, remember the assembly mindset). All programs were a monolithic 10 thousands lines of code with 1,000 global variables. 

This environment was called **OPM (Original Program Model)**. As you may tell, this way of programming was highly error-prone and difficult to maintain. Needless to say, if you change a program, you need to recompile it and recompile everything that is affected by that program. So, a better way of doing things was needed.

> Remember that this was done on a [5250 terminal](https://en.wikipedia.org/wiki/IBM_5250) green screen using [SEU](https://www.nicklitten.com/course/what-is-seu-source-entry-utility/).

## ILE

As complexity increased, a way to tackle it was needed. Modularization was the chosen way. 

Take that monolithic 10 thousand line program and divide it into logical units of execution called **functions**, which have their own context local variables that are created when the function executes and deleted after it finishes (pops up from the stack).

In this way, a monolithic program can be divided into a series of functions. Furthermore, these functions can be grouped together into their own object called **MODULE** so that a program **PGM** can be formed of one or more modules, which in turn are formed from one or more functions that are logically related. 

This mindset helped encapsulate business logic into some containerized context, which helps a lot when dealing with complexity on large code base systems. 

Some of that business logic may be needed by other programs. So, since we already have it compartmentalized on this **MODULE** object, let's make it available to be used by other programs so we have a central logic and don't do copy-paste the same code on every single program (this is something still seen in the wild). That's when the idea of the service program **SRVPGM** began. 

A service program is like a context of context. It has a series of **MODULES** with their corresponding functions that can be used by other programs, hence the name **service** program. 

Service programs and modules are the backbone of the modern development environment called **Integrated Language Environment (ILE)**. This is the environment that we'll be using in this guide.

## Structure of a RPG program

The **columnar** (legacy) RPG is composed of a series of **specifications**, **pages** or **contexts** which are roughly: 

- Compilation: Input parameters to be used by the compiler.
- Files: Listed files being written to, read from or updated.
- Data: Contains global character and numeric variables like data structures, arrays, ints, chars, etc. 
- Calculations: Operations or executable instructions to be performed. Usually grouped in **subroutines**
- Output: Report generation or I/O file operations.

A modern RPG, from now on **Free** RPG, does not have these clear specification separations. 

> **Free** means that you are not bound by columns anymore like the old columnar RPG used to be

- Compilation: Kept with the `Ctl-opt` keyword. 
- File: Kept, kinda. Files can be declared globally or inside a procedure, but it is usual to use embedded SQL to perform file operations on modern **SQLRPGLE** programs.
- Data: Variables can still be declared globally or locally to procedures. 
- Calculation: No longer defined and is replaced by procedure driven logic along with local variables. 
- Output: Very rarely used by hybrid RPG programs (half columnar and half free).

> Yes, you can use SQL statements along with RPG and move data between RPG host variables and SQL. Really cool stuff.

## Operating system

The capabilities of the RPG languages were tightly coupled to the machine architecture and the operating system. 

The **columnar** RPG II was used in the context of the [System/36](https://en.wikipedia.org/wiki/IBM_System/36). RPG III for the [System/38](https://en.wikipedia.org/wiki/IBM_System/38) and the [AS/400](https://en.wikipedia.org/wiki/IBM_AS/400).

The operating system of the **AS/400** was the **OS/400** which evolved into the [IBM i](https://en.wikipedia.org/wiki/IBM_i) and along came RPG IV or ILE RPG which is the **Free RPG** that we've seen.

For this guide we'll be using **Free** RPG on the **IBM I** operating system which is running on a [Power System](https://en.wikipedia.org/wiki/IBM_Power_Systems) over the internet called [PUB400](https://www.pub400.com/)

# The tools

Since this guide is intended to bring modern developers to IBM, we'll be using WSL Ubuntu and VsCode. 

Here is a good tutorial by **Seiden Group** on [Getting Started with VS Code for IBM i: A Video Series](https://www.seidengroup.com/getting-started-with-vs-code-for-ibm-i-a-video-series/) to get you up and running.

Also check this out: A [modern IBM I Pipeline](https://github.com/kraudy/IBM-i-pipeline).

# Chapters


To have each chapter as an IBM Project that can be deployed to PUB400 individually just run the `setup_workspace.sh` script like this

```bash
chmod +x ./setup_workspace.sh # Give execution permission
./setup_workspace.sh # Execute
```

- [Chaper 1](./chapter_1/chapter_1.md)
