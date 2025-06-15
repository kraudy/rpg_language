**Free
Ctl-opt DftActGrp(*no) main(main);

Dcl-proc main;
  dcl-pi *n;
    x packed(15:5);
  end-pi;

  dcl-s y packed(15:5) inz(*zeros);

  y = square(x);

  //snd-msg *Info %char(x) + ' ** 2 = ' %char(y);
  dsply %char(x);
  dsply %char(y);

  return;
end-proc;

dcl-proc square;
  dcl-pi *n packed(15:5);
    x packed(15:5) const;
  end-pi;

  return x * x;

end-proc;
