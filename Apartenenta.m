function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 

  %Tratam separat cazurile in care x nu se afla in intervalul [val1, val2]
  if x < val1
    y = 0;
    return;
  end
  
  if x > val2
    y = 1;
    return;
  end

  %Pentru a afla valorile a si b trebuie rezolvat sis de ecuatii:
  % val1 * a + b = 0
  % val2 * a + b = 1
  % Scotand pe b din prima ecuatie si inlocuind in a doua, obtinem:
  
  a = 1 / (val2 - val1);
  b = -val1 * a;
  
  %Valoarea functiei va fi:
  y = a * x + b;

  end