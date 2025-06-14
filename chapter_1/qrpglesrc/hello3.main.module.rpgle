**Free
///
// RPG Entry Module calling 2 prototyped procedures in the main
///
Ctl-opt main(main);

Dcl-pr hello;
End-pr;

Dcl-pr bye;
End-pr;

Dcl-proc main;
  Dcl-pi *n;
  end-pi;

  hello();

  bye();

  return;

End-proc;