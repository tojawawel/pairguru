class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:title] << 'Brackets are blank!' if
    blank_brackets?(record)
  end

  def blank_brackets?(record)
    brackets_pairs = %w[ [] {} () ]
    brackets_pairs.any? { |bracket_pair| record.title.include?(bracket_pair) }
  end
end
