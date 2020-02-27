class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :car

  def start_time
    self.start_date ##Wheredateart' is a attribute of type 'Date' accessible through MyModel's relationship
  end

   def end_time
    self.end_date ##Wheredateart' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
