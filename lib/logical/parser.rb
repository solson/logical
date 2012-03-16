require 'rltk/parser'

module Logical
  class Parser < RLTK::Parser
    production(:e) do
      clause('VAR') { |x| Variable.new(x) }

      clause('NOT e')          { |_, x|    Not.new(x)          }
      clause('e AND e')        { |x, _, y| And.new(x,y)        }
      clause('e OR e')         { |x, _, y| Or.new(x,y)         }
      clause('e IMPLIES e')    { |x, _, y| Implies.new(x,y)    }
      clause('e EQUIVALENT e') { |x, _, y| Equivalent.new(x,y) }

      clause('LPAREN e RPAREN') { |_, x, _| x }
    end

    finalize
  end
end
