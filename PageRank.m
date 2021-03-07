function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  %Determin numele fisierului de iesire
  nume_out = strcat(nume, '.out');
  output = fopen(nume_out, "w");
  input = fopen(nume, "r");
  
  %Determin vectorii de PageRank obtinuti cu cei 2 algoritmi
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d, eps);

  %Deschid fisierul de input si citesc intr-un vector datele
  v = fscanf(input, "%f");
  n = v(1);
  len = length(v);
  %Preiau val1 si val2 de la sfarsitul vectorului
  val1 = v(len-1);
  val2 = v(len);
  
  %Afisez cu format nr de noduri, apoi cei 2 vectori de PR-uri
  fprintf(output, "%d\n\n", n);
  fprintf(output, "%f\n", R1);
  fprintf(output, "\n");
  fprintf(output, "%f\n", R2);
  fprintf(output, "\n");
  
  %Construiesc un vector de indici
  indexes = 1:n;
  %Concatenez in matricea R3 vectorul crescator de indici
  R3(:,1) = indexes;
  important_pages = R2;
  
  %Trunchiez vectorul de pagini importante la 6 zecimale exacte  
  important_pages = fix(important_pages*10^7)/10^7;
  
  %Adaug vectorul de pagini importante drept a doua coloana a matricei R3
  R3(:,2) = important_pages;
  
  %Elementele din matricea R3 cu functia sortrows, descrescator dupa a 2-a
  %coloana si descrescator dupa prima
  R3 = sortrows(R3,[-2,-1]);
  %Adaug ca prima coloana a matricei vectorul de indici nemotificat
  R3 = [indexes' R3];

  %Inlocuiesc valorile din a 3-a coloana(vectorul de PR-uri) cu gradul
  %de apartenenta
  for i = 1 : n
    R3(i, 3) = Apartenenta(R3(i, 3), val1, val2);
  endfor
  
  %Afisez cu format matricea
  for i = 1 : n
    fprintf(output, "%d ", R3(i, 1));
    fprintf(output, "%d ", R3(i, 2));
    fprintf(output, "%f\n", R3(i, 3));
  endfor
  
  fclose(output);
  
end