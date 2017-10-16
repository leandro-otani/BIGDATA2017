import Data.Char

--Exercicio 2
mult3 x = x `mod` 3 == 0

--Exercicio 3
mult5 x = x `mod` 5 == 0

--Exercicio 4
mult35 x = x `mod` 5 == 0 && x `mod` 3 == 0

--Exercicio 5
ex5 :: Integer -> Bool
ex5 x
  | x < -1 = True
  | (x > 1 && mult2) = True
  | otherwise = False
  where
    mult2 = x `mod` 2 == 0

--Exercicio 6
div2d x = fromIntegral x / 2.0

--Exercicio 7
halfSine :: Double -> (Double, Double)
halfSine x = (s1, s2)
  where
    s1 = 0 + sqrt (1 - cos(x)) / 2
    s2 = 0 - sqrt (1 - cos(x)) / 2


--Exercicio 8
isLeap :: Integer -> Bool
isLeap year = (year `rem` 400 == 0) || 
  ((year `rem` 4 == 0) && (year `rem` 100 /= 0))
  

--Exercicio 10
getLeapTuple :: [Integer] -> ([Integer], [Integer])
getLeapTuple leapList = (firstHalf, secondHalf) 
  where
    firstHalf = take half leapList
    secondHalf = drop half leapList
    half = length leapList `div` 2


--Exercicio 11
concatStrings x y = x ++ " " ++ y

--Exercicio 12
parsedNumbers = map (\x -> digitToInt x) numbString
  where 
    numbString = "0123456789"

main = do
  print "Exercicio 1"
  let x = 2 * 3 + 5
  let y = 2 + 2 * 3 + 1
  let z = 3^4 + 5 * 2^5 + 1
  print (x)
  print (y)
  print (z)

  print "Exercicio 2"
  print (mult3 3)

  print "Exercicio 3"
  print (mult5 25)

  print "Exercicio 4"
  print (mult35 15)

  print "Exercicio 5"
  print (ex5 (-1115))

  print "Exercicio 6"
  print (div2d 10)

  print "Exercicio 7"
  print (halfSine 135)

  print "Exercicio 8"
  let leapList = [y | y <- [1..2017], isLeap y]
  print (leapList)

  --este exercicio esta com numeracao duplicada
  print "Exercicio 9"
  let first10 = take 10 leapList
  let last10 = drop (length leapList - 10) leapList
  print first10
  print last10

  print "Exercicio 10"
  print (getLeapTuple leapList)

  print "Exercicio 11"
  print (concatStrings "Hello" "World")

  print "Exercicio 12"
  print parsedNumbers