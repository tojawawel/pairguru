class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    unless record.title == "The  the Ring [Lord of The Rings] (2001) {Peter Jackson}"
      record.errors[:name] << 'namee is wrong'
    end
  end
end
