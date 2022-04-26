clc
clear all
close all

%a = [4 4; 8 2];
a = [17 -2 -3;-5 21 -2;-5 -5 22];
b = [500;200;30];


[n m]=size(a);

for i=1:n;
    if abs(a(i,i))<=sum(abs(a(1,:)))-abs(a(i,i))
      error("La matriz no es diagonalmente dominante");
    endif
end

ite=1;
x=zeros(n,1);




while ite<10
  
  #x=[x zeros(n,1)];
  y=x(:,ite);
  
  for i=1:n
    aux=0;
    for j=1:n
      if j!=i
        aux=aux+a(i,j)*x(j,ite);
      endif
    endfor
    y(i,1)=(b(i)-aux)/a(i,i);
  endfor
  
  
  x=[x y]
  ite=ite+1;
  
end



