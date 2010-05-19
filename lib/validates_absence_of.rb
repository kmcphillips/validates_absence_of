module ValidatesAbsenceOf
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def validates_absence_of(*attr)
      configuration = {:message => "must be blank"}
      configuration = configuration.merge(attr.extract_options!)
      configuration = configuration.merge(:allow_nil => false, :allow_blank => false, :in => [nil, ''])

      raise(ArgumentError, "An 'if' option is required for validates_absence_of") unless configuration[:if]

      validates_inclusion_of(attr, configuration)
    end
  end
end

