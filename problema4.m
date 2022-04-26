function x = problema4(a,b)

%eliminaciones gausianas en sentido contrario

  [n,m] = size(a);
  [nb,mb] = size(b);

  if n ~= m  | nb ~= n | mb ~= 1

    fprintf("Es probable que haya ingresado dimensiones \n")
    fprintf("no adecuada para las matrices de entrada.\n")
    error("No hay unicidad")

  end

  
  a=[a b];
  det=1;
  %a
  for k=n:-1:1
    
    %la primer columna debe ser la que tenga el mayor coeficiente
    [m, mi]=max(abs(a(1:k,k)));
    det=det*m; %Al m ser la diagonal, lo multiplicamos para optener el determinante

    if(mi!=k)
    %intercambio de columnas
      aux=a(k,:);
      a(k,:)=a(mi,:);
      a(mi,:)=aux*-1;
    endif
    %a

    %escalonamiento
    for j = k-1:-1:1
      
        if a(j,k) ~= 0  
         
         c = a(j,k)/a(k,k);
         a(j,:) = a(j,:)-c*a(k,:);
         
        end 
        
    end
  end
  x = zeros(n,1);
  c = a(:,1:n);
  d = a(:,n+1);
  
  for i = 1:n
    aux=0;
      
    for j=n:-1:1
      aux=aux+(c(i,j)*x(j,1)); 
    endfor
      
    x(i,1)=(d(i,1)-aux)/c(i,i);
  end
  
  
  
