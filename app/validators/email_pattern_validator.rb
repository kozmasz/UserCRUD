class EmailPatternValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    record.errors.add(attribute, :invalid_format) unless value.to_s.match(/\A[a-zA-Z0-9!\#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!\#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+(?:[a-zA-Z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)\z|^\z/)
  end
end
