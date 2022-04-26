function det = problema1(a)
  
  [n,m] = size(a);

  if n ~= m

    fprintf("Es probable que haya ingresado dimensiones \n")
    fprintf("no adecuada para las matrices de entrada.\n")
    error("No hay unicidad")

  end

  det=1;
  for k=1:n
    
    %la primer columna debe ser la que tenga el mayor coeficiente
    [m, mi]=max(abs(a(k:end,k)));
    det=det*m; %Al m ser la diagonal, lo multiplicamos para optener el determinante
    
    if(mi!=1)
    %intercambio de columnas
      aux=a(k,:);
      a(k,:)=a(mi+k-1,:);
      a(mi+k-1,:)=aux*-1;
    endif

    %escalonamiento
    for j = (k+1):n
        if a(j,k) ~= 0  
         c = a(j,k)/a(k,k);
         a(j,:) = a(j,:)-c*a(k,:);
        end 
    end
  end
  det=1;
  for j=1:n
    det=det*a(j,j);
  end
