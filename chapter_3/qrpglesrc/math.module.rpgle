**Free
Ctl-opt NoMain;

/include ../qprotosrc/math.rpgleinc

dcl-proc square export;
  dcl-pi *n packed(15:5);
    x packed(15:5) const;
  end-pi;

  return x ** 2;

end-proc;
