class Event < ActiveRecord::Base
  validate :enddatetime_after_startdatetime

  def enddatetime_after_startdatetime
    errors.add(:enddatetime, "The event cannot end before it starts") if
      enddatetime < startdatetime
  end
end
