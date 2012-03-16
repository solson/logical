# encoding: utf-8
require 'rltk/lexer'

class Logical::Lexer < RLTK::Lexer
  rule(/¬/)     { :NOT }
  rule(/not/)   { :NOT }
  rule(/∧/)     { :AND }
  rule(/and/)   { :AND }
  rule(/∨/)     { :OR }
  rule(/or/)    { :OR }
  rule(/→/)     { :IMPLIES }
  rule(/->/)    { :IMPLIES }
  rule(/↔/)     { :EQUIVALENT }
  rule(/<->/)   { :EQUIVALENT }
  rule(/\(/)    { :LPAREN }
  rule(/\)/)    { :RPAREN }

  rule(/[A-Z]/) { |t| [:VAR, t] }

  rule(/\s/)
end
