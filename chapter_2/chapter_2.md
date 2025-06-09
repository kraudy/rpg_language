# Chapter two: Service Programs

Creating programs from modules the way we did in chapter one can be tedious, but not only that, if the logic of a module is changed, the module and the program need to be recompiled. Imagine the case where you have a module on 50 different programs.

For that reason, an object called **Service Program** was created. Instead of having a copy of the compiled module on every program, a copy of the module is created on this special program called **Service Program**. 

In this way, programs that need to call a procedure from a module simply store a reference to the service program where they will search for the procedure symbol at compilation time and load the procedure dynamically at execution time. 

This avoids the problem of recompiling every program; only the module and the service program need to be recompiled.

## Content
- []()
- []()
- []()

## Modules to Service Program

Lets create a service program from the two hello modules of [Chapter 1](../chapter_1/chapter_1.md)

- [Hello World module](./ch1_qrpglesrc/hello2.nomain.module.rpgle#L7)
- [Bye World module](./ch1_qrpglesrc/bye.nomain.module.rpgle#L7)

```js
CRTSRVPGM SRVPGM(SRVHELLO)                            
MODULE(*CURLIB/HELLO2NENT *CURLIB/HELLO2BYE)
EXPORT(*ALL)                                
```
<div style="text-align: center;">
  <img src="../images/chapter_2/created_srvpgmhello.png" alt="created_srvpgmhello" style="display: inline-block;">
</div>

Do **OP 5** + `enter` + `enter` on the created **Service Program** 
<div style="text-align: center;">
  <img src="../images/chapter_2/modules_inside_srvpgm.png" alt="modules_inside_srvpgm" style="display: inline-block;">
</div>

There you have the compiled programs inside the service program. Again, hit `enter` + `enter`

<div style="text-align: center;">
  <img src="../images/chapter_2/srvpgm_symbols.png" alt="srvpgm_symbols" style="display: inline-block;">
</div>

That is the list of the export symbols by the service programs, not by each individual module like before.

Now, lets create the executable program with the service program instead of the two modules

```js
CRTPGM PGM(*CURLIB/HELLO4)        
MODULE(*CURLIB/HELLO2) ENTMOD(*CURLIB/HELLO2)     
BNDSRVPGM((*LIBL/SRVHELLO)) DETAIL(*FULL)              
```

<div style="text-align: center;">
  <img src="../images/chapter_2/program_from_srvpgm.png" alt="program_from_srvpgm" style="display: inline-block;">
</div>

Call the program `CALL PGM(*CURLIB/HELLO4)`. You should see the same *Hello World!* and *Bye World* as before.

Do **OP 5** on `HELLO4` + `enter` + `enter` + `enter` and there we have the service programs inside the program.

<div style="text-align: center;">
  <img src="../images/chapter_2/srvpgm_inside_pgm.png" alt="srvpgm_inside_pgm" style="display: inline-block;">
</div>

## Service Program from Binding Language

The previous way expose all the modules procedures to be accesed from outside, usually you don't want that since there are procedures that are only need by the module so they should not be accesible from outside
