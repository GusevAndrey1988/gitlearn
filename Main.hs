{-# LANGUAGE OverloadedLists #-}

module Main (main) where

import GHC.Conc (par)
import System.Environment (getArgs)

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = f1 `par` f2 `seq` f1 + f2 
  where
    f1 = fib (n - 1)
    f2 = fib (n - 2)

main :: IO ()
main = do
  (n : _) <- getArgs
  putStrLn $ "fib(" <> n <> ")=" <> show (fib $ read n)
