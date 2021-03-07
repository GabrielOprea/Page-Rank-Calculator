function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Pentru aceasta, determin matricile Q si R cu factorizari Gram-Schmidt, iar
  % apoi aplic SST de n ori pentru a rezolva sistemele de ecuatii
  % A * x(i) = e(i)
  
  %Aplic Gram-Schmidt
  n = size(A);
  for j = 1:n
    v = A(:,j);
    for i=1:j-1
      R(i,j) = Q(:,i)'*A(:,j);
      v = v - R(i,j)*Q(:,i);
    endfor
  R(j,j) = norm(v);
  Q(:,j) = v/R(j,j);
  endfor

  %Pentru a rezolva sistemele de ecuatii, facem prelucrarile:
  %A * x(i) = e(i)
  %Q * R * x(i) = e(i)
  %R * x(i) = Q' * e(i)
  
  I = eye(n);
  
  %Aplicam SST pentru a rezolva noul sistem de ecuatii
  for j = 1:n
    x = zeros(n,1);
    b = Q' * I(:, j);
	  for i = n : -1: 1
      x(i) = (b(i) - R(i,i+1:n)*x(i+1:n)) / R(i,i);
	  endfor
    B(:,j) = x; %Matricea solutie(inversa)
  endfor
 
endfunction