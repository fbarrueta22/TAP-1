exec('b.sci')

// Una función que crea la matriz P de orden 6
function [P] = P()

	ORDER = 6

	// Matriz original
	[N b] = plates(ORDER,1,1)

	// Resultado
	P = zeros(ORDER, ORDER)

	for i = 1:ORDER
		for j = 1:ORDER
			if( i == j)
				P(i,j) = N(i,j) - i*j
			else
				P(i,j) = N(7-i,j) - 1
			end
		end
	end
endfunction

disp(P())
