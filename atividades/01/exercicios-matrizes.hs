--Exercício 1
createMatrix :: Integer -> [[Integer]]
createMatrix size =  [[if (y == x) then 1 else 0 | x <- [1..size]] | y <- [1..size]]


--Exercício 2
getFirstDiag matrix = zipWith (!!) matrix [0..]
sumFirstDiag matrix = foldl (+) 0 (getFirstDiag matrix)
  
  
--Exercício 3
getSecondDiag matrix = zipWith (!!) matrix [length matrix-1, length matrix-2..]
sumSecondDiag matrix = foldl (+) 0 (getSecondDiag matrix)

main = do
  print "Exercicio 1"
  print (createMatrix 10)
  print "Exercicio 2"
  let matrix = createMatrix 5
  print matrix
  print (sumFirstDiag matrix)
  print "Exercicio 3"
  print (getSecondDiag matrix)
  print (sumSecondDiag matrix)