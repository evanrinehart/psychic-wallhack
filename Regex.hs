module Regex where

data Regex =
  Literally String |
  Capture Regex |
  AnyOf [CharClass] |
  AnythingBesides [CharClass] |
  One CharClass |
  ZeroOrMore Regex |
  OneOrMore Regex |
  Optional Regex |
  LineStart Regex |
  LineEnd Regex |
  Sequence [Regex]
    deriving (Show, Eq)
  
data CharClass =
  C Char |
  FromTo Char Char |
  Digit |
  Whitespace |
  WordCharacter |
  AnythingButNewline |
  Non CharClass
    deriving (Show, Eq)

parse :: String -> Either String Regex
parse = Left "dunno"


parse :: Parser Regex
parse = (eof >> return (Literally "")) <|> (many1 node)

node :: Parser Regex
node = 
... use expression parser, you will need to define precedence
rules for recursive descent

{-
regex language syntax:
R+
R*
R?
(R)
^R
R$
^R$
[CCCC-CC-C]
[^CCCC-CC-C]
abc
RRRR
.
\d
\w
\s
\D
\W
\S
\\ \. \* \+ \? \[ \] \( \) \^ \$

special characters
\ + * ? ( ) [ ] ^ $
-}
