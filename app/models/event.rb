class Event < ActiveRecord::Base
    validates :date, :presence => true
    validates :title, :uniqueness => true, :presence => true
    validates :organizer_name, :presence => true
    validate :must_be_in_future

    def must_be_in_future
      if date < Date.today  && !date.nil?
        errors.add(:date, "Can't be in the past")
      end
    end
end
