function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  %citesc toate informatiile din fisier ca un vector
  input = fopen(nume, "r");
  v = fscanf(input, "%lf");
  %obtin nr de noduri din graf si elimin n din vector
  n = v(1); v(1) = [];
  A = zeros(n,n);
  %pentru fiecare nod, citesc indicele si nr de vecini
  while length(v) > 2
    index = v(1); v(1) = [];
    nrVec = v(1); v(1) = [];
    %citesc fiecare vecin in crtEl si completez matricea de adiacenta
    while nrVec > 0
      crtEl = v(1); v(1) = [];
      nrVec = nrVec - 1;
      A(index, crtEl) = 1;
    endwhile
  endwhile
  
  %setez elementele de pe diagonala matricei la 0
  for i = 1 : n
    A(i,i) = 0;
    
  %completez un vector cu gradele de iesire pentru fiecare nod
  for i = 1 : n
    outdegrees(i) = sum(A(i,:));
  endfor
  
  %Calculeez cele 2 matrice auxiliare din algoritmul Iterative
  K = diag(outdegrees);
  M = (PR_Inv(K) * A)';
  
  I = ones(n, 1);
  R0 = I / n;
 
  %Execut iteratii pana cand norma diferentei valorii initiale cu cele
  %finale este mai mica decat toleranta 
  while 1
    R = d * M * R0 + (1 - d)/n * I;
    if norm(R - R0, 2) < eps
      break;
    endif
    R0 = R;
  endwhile 

  %Setez R la penultima matrice gasita
  R = R0;

end