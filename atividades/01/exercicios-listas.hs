--Exercicio 1
divisivel20 :: Int -> Bool
divisivel20 x = length list == 19
  where
  list = [i | i <- [11, 13, 17, 19], x `mod` i == 0]


--Exercicio 2  
loopTillDivisible :: Int -> Bool
loopTillDivisible val
  | val `mod` 2 /= 0 = loopTillDivisible (val+1)
  | otherwise = True
  
projectEuler5 = loopTillDivisible 1

--De acordo com a documentção do haskell, lcm ira achar o mdc e foldr irá reduzir com o operador binário.
projectEulerOtimizado = foldr1 lcm sequence
  where
    sequence = [1..20]


--Exercicio 3
fibonacci :: Int -> [Integer]
fibonacci n = take n infiniteFib
  where
    infiniteFib = 1 : 1 : zipWith (+) infiniteFib (tail infiniteFib)
   

--Exercicio 4
projectEuler2 :: [Integer] -> Integer
projectEuler2 sequence = foldl (+) 0 filteredArray
  where
    filteredArray = [n | n <- takeWhile(<= 4000000) sequence, n `mod` 2 == 0]
  

--Exercicio 5
scalarProduct :: [Integer] -> [Integer] -> Integer
scalarProduct vector1 vector2 = sum (zipWith (*) vector1 vector2)


--Exercicio 6
collatz :: Integer -> Integer
collatz x
  | isEven = x `div` 2
  | otherwise = 3 * x + 1
  where
    isEven = (x `mod` 2) == 0
    

--Exercicio 7
collatzLen x = collatzLenAux x 0

collatzLenAux 1 count = count
collatzLenAux x count = collatzLenAux (collatz x) (count + 1)


--Exercicio 8
maximumCollatz :: Integer -> Integer
maximumCollatz threshold = maximum[collatzLen n | n <- [1..threshold]]
  

main = do
  print "Exercicio 1"
  print (divisivel20 20)
  print "Exercicio 2"
  --print (projectEuler5)
  print "Precisa de otimizacao -> Otimizado de acordo com documentação"
  print projectEulerOtimizado
  print "Exercicio 3"
  let sequence = fibonacci 6
  print sequence
  print "Exercicio 4"
  print (projectEuler2 sequence)
  print "Exercicio 5"
  print (scalarProduct [1..10] [15..25])
  print "Exercicio 6"
  print (collatz 3)
  print "Exercicio 7"
  print (collatzLen 3)
  print "Exercicio 8"
  print "Precisa de otimizacao"
  print (maximumCollatz 1000000)