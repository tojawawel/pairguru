class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    if blank_brackets?(record)
      record.errors[:title] << 'Brackets are blank!'
    elsif open_brackets?(record)
      record.errors[:title] << 'Brackets are not closed properly!'
    end
  end

private
  def blank_brackets?(record)
    brackets_pairs = %w[ [] {} () ]
    brackets_pairs.any? { |bracket_pair| record.title.include?(bracket_pair) }
  end

  def open_brackets?(record)
    pairs = {"{"=> "}", "["=> "]", "("=> ")"}
    stack = []
    record.title.each_char do |char|
      if pairs.keys.any? { |opening_bracket| opening_bracket == char}
        stack << char
      elsif pairs.values.any? { |closing_bracket| closing_bracket == char}
        if char != pairs[stack.last]
          return true
        else
          stack.pop
        end
      end
    end
    stack.any?
  end
end
