ActiveRecord::Schema.define(:version => 0) do
  create_table :pies, :force => true do |t|
    t.column :active, :boolean, :default => true
    t.column :reason_deactivated, :string
  end
end