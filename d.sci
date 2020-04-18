exec('platesD.sci')

filas=5

[A b] = platesD(filas,1,1)

printf('A:\n')
disp(A)
printf('\n')

printf('b:\n')
disp(b)
printf('\n')

rA = rank(A)
rAb = rank([A b])
[n _n] = size(b)

if(rA == rAb)
	if(rA == n)
		printf('Determinado\n')
	elseif(rA < n)
		printf('Indeterminado\n')
	end
else
	printf('Sin solución\n')
end
