class Bracket
  def initialize(n)
    @n = n
    @out = []
    @result = []
  end
  
  def asso(seq, kw)
    if (level == 2 * @n)
      @result << @out.clone
    else
      @out[level] = '('
      if (opent + 1) <= @n && opent >= close
        printbracket(level + 1, opent + 1, close)
      end

      @out[level] = ')'
      if (close + 1) <= @n && opent >= close
        printbracket(level + 1, opent, close + 1)
      end
    end
  end
  
  

  def bracket
    printbracket(0,0,0)
    
    @result.each do |t|
      puts t.join
    end
  end
end

Bracket.asst(['a','b','c','d']).each do |x|
  puts x
end
