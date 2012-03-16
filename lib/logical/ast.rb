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

    def evaluate(context)
      context[name]
    end
  end

  class True < Expression
    def inspect
      "true"
    end

    def evaluate(context)
      true
    end
  end

  class False < Expression
    def inspect
      "false"
    end

    def evaluate(context)
      false
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

  class Not < UnaryFn
    def evaluate(context)
      not arg.evaluate(context)
    end
  end

  class And < BinaryFn
    def evaluate(context)
      left.evaluate(context) and right.evaluate(context)
    end
  end

  class Or < BinaryFn
    def evaluate(context)
      left.evaluate(context) or right.evaluate(context)
    end
  end

  class Implies < BinaryFn
    def evaluate(context)
      (not left.evaluate(context)) or right.evaluate(context)
    end
  end

  class Equivalent < BinaryFn
    def evaluate(context)
      left.evaluate(context) == right.evaluate(context)
    end
  end
end
