module Address_validations
  extend ActiveSupport::Concern
  included do
    validates :address, length:{maximum:96}, allow_nil: true
    validates :street, presence: true, length:{maximum:30}
    validates :city, presence: true, length:{maximum:30}
    validates :state, presence: true, length:{maximum:30}
    validates :pincode, presence: true, numericality:{only_integer: true}, length:{is:6}
  end
end

module Address_form
  extend ActiveSupport::Concern
  
  def form_address
    self.address = (self.street+', '+self.city+', '+self.state+' -'+self.pincode)
  end
end