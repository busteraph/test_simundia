class Collaborator
 	attr_accessor :first_name, :last_name, :email, :scope_id

  def initialize(first_name, last_name, email, scope_id)
    self.first_name = first_name
    self.last_name = last_name
    self.email = email
    self.scope_id = scope_id
  end

 def to_csv 
 	 [first_name, last_name, email, scope_id]
 end	

end