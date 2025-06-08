# Chapter two: Service Programs

Creating programs from modules the way we did in chapter one can be tedious, but not only that, if the logic of a module is changed, the module and the program need to be recompiled. Imagine the case where you have a module on 50 different programs.

For that reason, an object called **Service Program** was created. Instead of having a copy of the compiled module on every program, a copy of the module is created on this special program called **Service Program**. 

In this way, programs that need to call a procedure from a module simply store a reference to the service program where they will search for the procedure symbol at compilation time and load the procedure dynamically at execution time. 

This avoids the problem of recompiling every program; only the module and the service program need to be recompiled.

## Content

## Modules to Service Program




