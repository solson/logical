require 'rltk/ast'

class Class
  def basename
    name.match(/::(.*)$/).captures.first.downcase
  end
end

module Logical
  class Expression < RLTK::ASTNode; end

  class Variable < Expression
    value :name, String

    def inspect
      name
    end
  end

  class UnaryFn < Expression
    child :arg, Expression

    def inspect
      "#{self.class.basename}(#{arg.inspect})"
    end
  end

  class BinaryFn < Expression
    child :left,  Expression
    child :right, Expression

    def inspect
      "#{self.class.basename}(#{left.inspect}, #{right.inspect})"
    end
  end

  class Not < UnaryFn; end
  class And < BinaryFn; end
  class Or < BinaryFn; end
  class Implies < BinaryFn; end
  class Equivalent < BinaryFn; end
end
