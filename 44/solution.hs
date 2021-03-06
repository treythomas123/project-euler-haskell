-- Solution to Project Euler problem 44
-- By Trey Thomas
--
-- Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten
-- pentagonal numbers are:
--
-- 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
--
-- It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference,
-- 70 − 22 = 48, is not pentagonal.
--
-- Find the pair of pentagonal numbers, Pj and Pk, for which their sum and
-- difference are pentagonal and D = |Pk − Pj| is minimised; what is the value
-- of D?

pentagonals :: [Int]
pentagonals = [ n * (3*n - 1) `div` 2 | n <- [1..] ]

isPentagonal :: Int -> Bool
isPentagonal p = p == (head $ dropWhile (<p) pentagonals)

pairs = concat [ [ (pentagonals !! j, pentagonals !! (i-j)) | j <- [0..div i 2]] | i <- [0..] ]

sumDiffPentagonal t = isPentagonal (snd t - fst t) && isPentagonal (fst t + snd t)

main = print $ (\t -> snd t - fst t) $ head $ dropWhile (not . sumDiffPentagonal) $ pairs
