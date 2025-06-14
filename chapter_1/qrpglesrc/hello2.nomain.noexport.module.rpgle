**Free
///
// RPG Module with only 1 procedure, no main and no export.
///
Ctl-opt NoMain;

Dcl-proc hello;
  Dcl-pi *n;
  end-pi;

  dsply 'Hello world!';

  return;

End-proc;