ActiveRecord::Schema.define do
  create_table "articles", :force => true do |t|
    t.column "title",         :string
    t.column "body",          :text
    t.column "body_html",     :text
    t.column "body_htmlized", :text
    t.column "created_at",    :datetime
    t.column "updated_at",    :datetime
  end
end
