module Address_form
  extend ActiveSupport::Concern
  
  def form_address
    self.address = self.street+', '+self.city+', '+self.state+' -'+self.pincode
  end
end

module Address_validations
  extend ActiveSupport::Concern
  included do
    validates :street, presence: true, length:{maximum:15}
    validates :city, presence: true, length:{maximum:11}
    validates :state, presence: true, length:{maximum:11}
    validates :pincode, presence: true, numericality:{only_integer: true}, length:{is:6}
  end
end