module Boolean2TM where

import GrammarType
import TMTypes
import Data.Char (chr, ord)
import qualified Data.Set as Set
import qualified Data.Map as Map
import Data.List
import Data.Ord

newtype ConjunctionPair = ConjunctionPair (Integer, Nonterminal, Nonterminal)

-- firstly generating descriptional states (name of states describes, which activities TM does in this state), 
-- after convert it to state Q_index from TMTypes module via bijective transformation
-- c |-> chr $ c + (ord 'a' - 1)
-- (transformation is bijective, since will use only chars 'A'..'Z','a'..'z', '1'..'9', '-' with disjoint prefixes for debugging names)
newtype DebuggingState = DState String

{--boolean2tm :: Grammar -> TuringMachine
boolean2tm
    (Grammar
        (setOfNonterminals,
        setOfTerminals,
        setOfRelations,
        Nonterminal startSymbol)) = do --}
 
-- naming for blocks of TM?
{-generateQFindNewSubstitution :: Grammar -> Quadruples
  
generateQRefineConjunctionDetails :: Grammar -> Quadruples

generateQFoldConjCallNextConjFromSameRule :: Grammar -> Quadruples

generateQFoldConjCallNextConjFromNextRule :: Grammar -> Quadruples

generateQFoldConjunctionPutResult :: Grammar -> Quadruples

generateQRetryConjunction :: Grammar -> Quadruples

generateQCreateNewSubstitution :: Grammar -> Quadruples

generateQFigureWordOrSymbol :: Grammar -> Quadruples

generateQGetResultForSymbol :: Grammar -> Quadruples --}

-- helper functions
convertDebuggingStateToState :: DebuggingState -> State
convertDebuggingStateToState (DState string) = Q number where
    number = read (concatMap (show . ord) string) :: Int

calculateMaxNumberOfRulesForNonterminal :: Grammar -> Int
calculateMaxNumberOfRulesForNonterminal (Grammar (_, _, relations, _)) = let 
  listRelations = Set.toList relations
  groupedRelations = Map.fromListWith (++) [(nonterminal, [symbols]) | Relation (nonterminal, symbols) <- listRelations]
  in (snd $ maximumBy (comparing snd) (Map.toList $ Map.map length groupedRelations))





{---calculateNextConjunctionInSameRule :: ConjunctionPair -> ConjunctionPair

calculateNextConjunctionInNextRule :: ConjunctionPair -> ConjunctionPair--} 




