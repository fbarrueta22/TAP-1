exec('PMatrix.sci')
exec('gauss.sci')


// La misma matriz que en el ejercicio e
[N, b] = plates(6, 1.25, 1.2)

x=gauss(PMatrix()',b)
disp('Ejercicio G:')
disp('X =')
disp(x)
