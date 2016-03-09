module Main where
--------------------------------------------------------------------------
import Data.List
--------------------------------------------------------------------------
main :: IO ()
main = do
  print $ "Lists"
  print $ "------------------------------"
  print $ sum3 [1,1] [2,3,5] [1,1]
  print $ sum3 [1] [1] [1,0]
  print $ "------------------------------"
  print $ sum3' [1,1] [2,3,5] [1,1]
  print $ sum3' [1] [1] [1,0]
  print $ "------------------------------"
--------------------------------------------------------------------------
split []     = (0,[])
split (x:xs) = (x, xs)
--------------------------------------------------------------------------
sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 [] [] [] = []
sum3 a b c = let
  splitA = split a
  splitB = split b
  splitC = split c
  in (fst splitA  + fst splitB + fst splitC) :
    sum3 (snd splitA) (snd splitB) (snd splitC)
--------------------------------------------------------------------------
sum3' :: Num a => [a] -> [a] -> [a] -> [a]
sum3' a b c = map sum $ transpose [a, b, c]
--------------------------------------------------------------------------