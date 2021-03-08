# Page-Rank-Calculator
The program receives a graph represented as adjacency matrix and computes the page rank vector using Iterative and Algebraic algorithms and decides which pages are the most important.

I first implemented the Algebraic and Iterative algorithms for computing the
Page Rank vectors. Then I used PR_Inv function to calculate the inverse of
a matrix. This function is faster than inv(), because it uses Gram Schmidt Q-R
factorisation.

Apartenenta.m evaluates the member function in a specific value x, and decides
if the page is an important one. These pages are then sorted in ascending order
in the PageRank.m file, that reads the input graph from file, and prints
the results with format.
