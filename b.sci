// Una función que crea con filas arbitrarias
// la matriz A de coeficientes y el vector b
function [A, b] = plates(filas)

	// Constantes
	V=100
	L=500
	y0=0.09
	x0=0
	m=0.12

	// Vector b
	b = zeros(filas,1)
	b(1) = V*y0

	// Matriz de coeficientes
	_A = zeros(filas, filas+2)

	// La fila que forma el resto de filas
	fila = [-V*m L+m*V -L]

	for i = 1:filas
		_A(i,:) = _A(i,:) + [zeros(1, i-1) fila zeros(1, filas+2-3-(i-1))]
	end

	// En la primera fila el -V*m no existe y en la última fila
	// el -L tampoco.
	A = _A(:,2:filas+1)
endfunction

function mainB()
	filas=5

	[A b] = plates(filas)

	printf('A:\n')
	disp(A)
	printf('\n')

	printf('B:\n')
	disp(b)
	printf('\n')
endfunction
