--Exercicio 1
ehTriangulo :: Double -> Double -> Double -> Bool
ehTriangulo a b c 
  | m1 < a && a < b + c = True
  | m2 < b && b < a + c = True
  | m3 < c && c < a + b = True
  | otherwise = False
  where
    m1 = abs (b - c)
    m2 = abs (a - c)
    m3 = abs (a - b)


--Exercicio 2
tipoTriangulo :: Double -> Double -> Double -> String
tipoTriangulo a b c 
  | a == b && b == c = "Equilatero"
  | a == b || b == c || c == a = "Isosceles"
  | a /= b && b /= c && c /= a = "Escaleno"
  | otherwise = "Desconhecido"


--Exercicio 3
isOdd x = x `mod` 2 /= 0 
ethiopianMult :: Integer -> Integer -> Integer
ethiopianMult 1 n = n
ethiopianMult m n
  | isOdd m = n + ethiopianMult (m `div` 2) (n * 2)
  | otherwise = ethiopianMult (m `div` 2) (n * 2)


--Exercicio 4
countPrime :: Integer -> Int
countPrime x = length [i | i <- [1..x], x `mod` i == 0]

isPrimeNumber :: Integer -> Bool
isPrimeNumber x = countPrime x == 2


--Exercicio 5
sumDigits :: Integer -> Integer
sumDigits x
  | x `mod` 10 == x = x
  | otherwise = x `mod` 10 + sumDigits(x `div` 10)


--Exercicio 6
additiveP x sum
  | x `mod` 10 == x = sum
  | otherwise = additiveP (sumDigits x) (sum + 1)


--Exercicio 7
fact :: Integer -> Integer
fact 0 = 1
fact 1 = 1
fact n = n * fact (n-1)

binCoef :: Integer -> Integer -> Integer
binCoef n k = fact n `div` (fact k * fact (n-k))

--Exercicio 8
pascalPos :: Integer -> Integer -> Integer
pascalPos i j = binCoef (i - 1) (j - 1)


main = do
    print "Exercicio 1"
    print (ehTriangulo 10 14 8)
    print "Exercicio 2"
    print (tipoTriangulo 14 14 14)
    print "Exercicio 3"
    print (ethiopianMult 14 12)
    print "Exercicio 4"
    print (isPrimeNumber 13)  
    print "Exercicio 5"
    print (sumDigits 233)
    print "Exercicio 6"
    print (additiveP 1239 0)
    print "Exercicio 7"
    print (binCoef 1231 2)
    print "Exercicio 8"
    print (pascalPos 8 7)
