function x = problema2(a)
  [P,L,U] = PLU_factorizacion(a);
  [n m]=size(a);

  x = zeros(n,n);
  for m=1:n

    %obtener z
    id=zeros(1,n).';
    id(m)=1;

    c = L;
    d = id;

    z = zeros(n,1);

    for i = 1:n
      aux=0;      
      for j=1:n
          aux=aux+(c(i,j)*z(j,1)); 
      endfor
      
      z(i,1)=(d(i,1)-aux);
    end
    
    %obtener x
    c = U;
    d = z;
    
    for i = n:-1:1
      aux=0;
      for j=n:-1:1
          aux=aux+(c(i,j)*x(j,m)); 
      endfor
      
      x(i,m)=(d(i,1)-aux)/c(i,i);
    end
    
  end

  x=x*P;