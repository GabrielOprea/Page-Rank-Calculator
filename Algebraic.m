function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  %citesc vectorul cu elementele fisierului
	input = fopen(nume, "r");
  v = fscanf(input, "%lf");
  %citesc numarul de noduri si il elimin din vector
  n = v(1); v(1) = [];
  A = zeros(n,n); 
  %Pentru fiecare linie, citesc indicele nodului si nr de vecini
  while length(v) > 2
    index = v(1); v(1) = [];
    nrVec = v(1); v(1) = [];
    %Completez matricea de adiacenta
    while nrVec > 0
      crtEl = v(1); v(1) = [];
      nrVec = nrVec - 1;
      A(index, crtEl) = 1;
    endwhile
  endwhile
  %Setez elementele de pe diagonala cu 0 si calculez gradul de iesire
  for i = 1 : n
    A(i,i) = 0;
    
  for i = 1 : n
    outdegrees(i) = sum(A(i,:));
  endfor
  
  K = diag(outdegrees);
  M = (PR_Inv(K) * A)';
  
  %Aplic algoritmul Algebraic
  Ones_col = ones(n,1);
  I = eye(n);
  R = PR_Inv(I - d * M) * (1 - d) / n * Ones_col;
end