ValidatesAbsenceOf
==================

The missing complementary validation to validates_presence_of. Requires the :if option.

Options all work like existing active record validations:

* :in
* :message
* :if
* :unless


Example
=======

If we have a model with an active boolean column, we only want the deactivated reason to be set if the object has been deactivated.

    class Something < ActiveRecord::Base
        validates_abasence_of :deactivated_reason, :if => "active"
    end


Copyright (c) 2010 [Kevin McPhillips](github@kevinmcphillips.ca), released under the MIT license
