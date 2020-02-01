import System.Environment


showT :: Int -> String
showT x = if x>0 then show x else "0" ++ show x
time :: Int -> String
time x = 
    showT (div x 3600) ++ ":" ++ 
    showT (div(mod x 3600)60) ++ ":" ++ 
    showT (mod(mod x 3600)60)

main = do 
    (x:xs) <- getArgs  
    let y = (read x)::Int in  putStrLn $ time y


