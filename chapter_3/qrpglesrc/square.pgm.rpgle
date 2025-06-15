**Free
Ctl-opt DftActGrp(*no) main(main) BndDir('BNDMATH');

/include ../qprotosrc/math.rpgleinc

Dcl-proc main;
  dcl-pi *n;
    x packed(15:5);
  end-pi;

  dcl-s y packed(15:5) inz(*zeros);

  y = square(x);

  dsply %char(y);

  return;
end-proc;
