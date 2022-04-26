function x = problema3(a,b)
  
  [n,m] = size(a);
  [nb,mb] = size(b);
  %comprobar que las matrices tienen las proporciones correctas
  if n ~= m  | nb ~= n | mb ~= 1
    fprintf("Es probable que haya ingresado dimensiones \n")
    fprintf("no adecuada para las matrices de entrada.\n")
    error("No hay unicidad")
  endif
  %comprobar que a es una matriz simetrica
  for i=1:n
    for j=1:n
      if(a(i,j)!=a(j,i))
        fprintf("La matriz no es simetrica\n");
        error("No hay simetria");
      endif
    endfor
  endfor
  %comprobar que a es una matriz positiva
  for i=1:n
    if(problema1(a(1:i,1:i))<0)
      fprintf("La matriz no es positiva.\n");
      error("No hay positividad");
    endif
  endfor
  %matriz L
  l=zeros(n,n);
  lt=zeros(n,n);
  l(1,1)=sqrt(a(1,1));
  lt(1,1)=sqrt(a(1,1));
  for i=2:n
    %aristas
    for j=i:n %i=2 j=2    i=3 j=3
      
      aux=0;
      for k=1:i-2%i=2 k=0     %i=3 j=3 k=1
        aux=aux+l(i,k)*l(i-1,k);
      endfor
      
      l(j,i-1)=(a(j,i-1)-aux)/l(i-1,i-1);
      lt(i-1,j)=(a(j,i-1)-aux)/l(i-1,i-1);
    endfor

    %centros
    aux=0;
    for j=1:i-1
      aux=aux+l(i,j)*l(i,j);
    endfor
    l(i,i)=sqrt(a(i,i)-aux);
    lt(i,i)=sqrt(a(i,i)-aux);
  endfor

  %encontrar y
  y = zeros(n,1);
    
  for i = 1:n
    aux=0;
          
    for j=n:-1:1
      aux=aux+(l(i,j)*y(j,1)); 
    endfor
          
    y(i,1)=(b(i,1)-aux)/l(i,i);
  end

  %encontrar x
  x = zeros(n,1);
  for i = n:-1:1
    aux=0;
          
    for j=n:-1:1
      aux=aux+(lt(i,j)*x(j,1)); 
    endfor
          
    x(i,1)=(y(i,1)-aux)/lt(i,i);
  end