> import Control.Monad
> import Data.Time.Format
> import Data.Time.LocalTime
> import System.Locale

This is a utility that reads input from standard input and applies a
timestamp to it, emitting the modified line to standard output.

The default timestamp is of the form "2006-01-02 15:03:04".

> defaultFormat :: String
> defaultFormat = "%F %T %Z "

The following takes a timestamp and places a formatted version of it
into the IO monad.

> formatDateTime :: (FormatTime t) => t -> IO String
> formatDateTime t = return $ formatTime defaultTimeLocale defaultFormat t

We'll use this to get the timestamp for right now, printing that out
to standard output.

> timestamp :: String -> IO String
> timestamp s = getZonedTime >>= formatDateTime >>= putStr >>  return s

For each line of input, output the formatted timestamp and the
line. The order of the first two arguments is important; putting
timestamp first means the timestamp is generated when this function is
run, not when a line of input is read.

> timestampIt :: IO ()
> timestampIt = getLine >>= timestamp >>= putStrLn

Main just needs to run forever, reading lines and timestamping them.

> main = forever timestampIt

