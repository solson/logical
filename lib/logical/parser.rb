require 'rltk/parser'

class Logical::Parser < RLTK::Parser
  production(:e) do
    clause('VAR') { |x| x }

    clause('NOT e') { |_, x| "not(#{x})" }
    clause('e AND e') { |x, _, y| "and(#{x}, #{y})" }
    clause('e OR e')  { |x, _, y| "or(#{x}, #{y})" }
    clause('e IMPLIES e') { |x, _, y| "implies(#{x}, #{y})" }
    clause('e EQUIVALENT e') { |x, _, y| "equivalent(#{x}, #{y})" }

    clause('LPAREN e RPAREN') { |_, x, _| x }
  end

  finalize
end
